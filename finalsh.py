import requests
import psycopg2
from psycopg2 import sql
import re

conn = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="postgres",
    password="123456"
)
url = "https://api.digikala.com/v1/categories/mobile-phone/brands/samsung/search/"
response = requests.get(url)
data = response.json()
total_pages=data["data"]["pager"]["total_pages"]
list_product=[]
for j in range(total_pages+1):
    url2 = f'https://api.digikala.com/v1/categories/mobile-phone/brands/samsung/search/?page={j}'
    response = requests.get(url2)
    data = response.json()
    main_product = data["data"]["products"]
    list_product.append(main_product)

list_id=[]

for item in list_product:
    for product in item:
        list_id.append(product["id"])

cleaned_products = []
for i in list_id:
    url_detail = f'https://api.digikala.com/v2/product/{i}/'
    response_detail = requests.get(url_detail)
    product_detail = response_detail.json()
    product_detail2=product_detail["data"]["product"]
    cleaned_products.append(product_detail2)



products = []
def Attr_Value (inp_title,list_product):
    tvalue="یافت نشد"
    for spcification in list_product:
        spcifications = spcification["attributes"]
        for attribute in spcifications:
            if attribute["title"] == inp_title:
                tvalue = attribute["values"]
    if (inp_title == "شبکه‌های مخابراتی" and '5G' in str(tvalue)):
        tvalue="TRUE"
    elif (inp_title == "شبکه‌های مخابراتی" and '5G' not in str(tvalue)):
        tvalue = "FALSE"
    return tvalue


for product in cleaned_products:
    product_attributes = product["specifications"]
    product_variant = product["default_variant"]
    if not product_variant:
        continue

    match = re.search(r'(\d+\.\d+)', str(Attr_Value("اندازه",product_attributes)))

    if match:
        number = float(match.group(1))

    def extract_largest_number(text):
        # استخراج تمام اعداد اعشاری (اعداد اعشاری که ممکن است با - از هم جدا شده باشند)
        numbers = re.findall(r'\d+\.\d+', text)

        # تبدیل اعداد به نوع float و پیدا کردن بزرگترین عدد
        if numbers:
            numbers = [float(num) for num in numbers]
            return max(numbers)
        else:
            return None

    products.append({
        "id": product["id"],
        "مدل":re.sub(r"['\[\]]+", '', str(Attr_Value("مدل",product_attributes))),
        "وزن":re.sub(r'\D', '', str(Attr_Value("وزن",product_attributes))),
        "اندازه":number,
        "تراکم پیکسلی":re.sub(r'\D', '', str( Attr_Value("تراکم پیکسلی", product_attributes))),
        "فرکانس پردازنده‌ مرکزی":extract_largest_number (str(Attr_Value("فرکانس پردازنده‌ مرکزی", product_attributes))),
        "حافظه داخلی":re.sub(r'\D', '', str( Attr_Value("حافظه داخلی", product_attributes))),
        "مقدار RAM":re.sub(r'\D', '', str( Attr_Value("مقدار RAM", product_attributes))),
        "شبکه‌های مخابراتی": Attr_Value("شبکه‌های مخابراتی", product_attributes),
        "رزولوشن دوربین اصلی":re.sub(r'\D', '', str( Attr_Value("رزولوشن دوربین اصلی", product_attributes))),
        "ظرفیت باتری":re.sub(r'\D', '', str( Attr_Value("ظرفیت باتری", product_attributes))),
        "قیمت": product_variant["price"]["selling_price"]
    })
#print(products)

cursor = conn.cursor()
create_table_query = '''
CREATE TABLE IF NOT EXISTS samsung_phone_finall (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    weight VARCHAR(255),
    sizee  VARCHAR(255),
    pixel VARCHAR(255),
    cpu VARCHAR(255),
    memory VARCHAR(255),
    ram VARCHAR(255),
    network5G VARCHAR(255),
    cammera VARCHAR(255),
    battry VARCHAR(255),
    pricee VARCHAR(255)
    
);
'''
cursor.execute(create_table_query)
conn.commit()
print("جدول با موفقیت ایجاد شد.")
for item in products:
    id = item['id']
    title = item['مدل']
    weight = item['وزن']
    sizee = item['اندازه']
    pixel = item['تراکم پیکسلی']
    cpu = item['فرکانس پردازنده‌ مرکزی']
    memory = item['حافظه داخلی']
    ram = item['مقدار RAM']
    network5G = item['شبکه‌های مخابراتی']
    cammera = item['رزولوشن دوربین اصلی']
    battry = item['ظرفیت باتری']
    pricee = item['قیمت']

    # بررسی اینکه آیا موبایل قبلاً در دیتابیس وجود دارد یا خیر
    cursor.execute("SELECT id FROM samsung_phone_finall WHERE id = %s", (id,))
    result = cursor.fetchone()

    if result:
        # اگر موبایل موجود بود، به‌روزرسانی می‌شود
        cursor.execute(
            "UPDATE samsung_phone_finall SET id = %s, title = %s, weight = %s,sizee = %s,pixel = %s,cpu = %s,memory = %s,ram = %s,network5G = %s,cammera = %s,battry = %s,pricee = %s WHERE id = %s",
            (id, title, weight,sizee,pixel,cpu,memory,ram,network5G,cammera,battry,pricee,id)
        )
    else:
        # اگر موبایل جدید بود، به دیتابیس اضافه می‌شود
        cursor.execute(
            "INSERT INTO samsung_phone_finall (id, title, weight,sizee,pixel,cpu,memory,ram,network5G,cammera,battry,pricee) VALUES (%s, %s, %s,%s, %s, %s,%s, %s, %s,%s, %s, %s)",
            (id, title, weight,sizee,pixel,cpu,memory,ram,network5G,cammera,battry,pricee)
        )


    conn.commit()

cursor.close()
conn.close()
