from flask import Flask, render_template

app = Flask(__name__)

# ข้อมูลนักศึกษา (แทนที่ด้วยข้อมูลจริง)
STUDENT_ID = "68XXXX1234"
GITHUB_LINK = "https://github.com/YourGitHubUsername/YourRepoName" # เปลี่ยน YourGitHubUsername/YourRepoName
DOCKER_LINK = "https://hub.docker.com/repositories/muntho" # เปลี่ยน YourDockerUsername/YourImageName

# Route สำหรับหน้า Home
@app.route("/")
def home():
    # ส่งข้อมูลไปยัง home.html
    return render_template("home.html", student_id=STUDENT_ID, github_link=GITHUB_LINK, docker_link=DOCKER_LINK)

# Route สำหรับหน้า Git
@app.route("/git")
def git_page():
    # ส่งข้อมูลไปยัง git.html
    return render_template("git.html")

# Route สำหรับหน้า Docker
@app.route("/docker")
def docker_page():
    # ส่งข้อมูลไปยัง docker_info.html
    return render_template("docker_info.html")

if __name__ == "__main__":
    # รัน Flask app บนทุก IP และ Port 5000
    app.run(host='0.0.0.0', port=5000, debug=True)