from flask import Flask, render_template, render_template_string, request

app = Flask(__name__)

@app.route("/")
def get_user_file():
    f_name = request.args.get('file')
    with open(f_name) as f:
        return f.readlines()

if __name__ ==  "__main__":
    app.run(debug=False)
