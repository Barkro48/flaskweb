# 1. Base Image: ใช้ Python เวอร์ชัน 3.11-slim ซึ่งเป็นเวอร์ชันที่เล็กและมีแค่สิ่งจำเป็น
FROM python:3.11-slim

# 2. Working Directory: สร้างและตั้งค่า /usr/src/app เป็นไดเรกทอรีทำงานภายในคอนเทนเนอร์
WORKDIR /usr/src/app

# 3. Dependencies: คัดลอกไฟล์ requirements.txt และติดตั้ง Flask
COPY requirements.txt ./
# --no-cache-dir ช่วยลดขนาด Image
RUN pip install --no-cache-dir -r requirements.txt

# 4. Application Code: คัดลอกไฟล์ทั้งหมดจากเครื่อง Host ปัจจุบัน (รวมถึง app.py และ templates/) ไปยัง Working Directory
COPY . .

# 5. Expose Port: แจ้งให้ Docker ทราบว่าแอปพลิเคชันภายในรันที่พอร์ต 5000
EXPOSE 5000

# 6. Run Command: คำสั่งที่จะถูกเรียกใช้เมื่อ Container ถูกสั่งทำงาน
# Flask ควรถูกรันบน host 0.0.0.0 เพื่อให้เข้าถึงได้จากภายนอก Container
CMD ["python", "app.py"]