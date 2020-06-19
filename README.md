# t3-console

## Setup

```bash
# Clone repo
git clone https://github.com/atstpls/t3-console.git
cd t3-console

# Create virtualenv
python3 -m venv venv
source venv/bin/activate
echo $(pwd) > $(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")/path.pth
echo "FLASK_APP=t3.py" > .flaskenv
pip install -r requirements.txt
```

## Operation

```bash
# Run in venv
flask run

# Run in container
docker build -t t3-console .
docker run --name t3-console -d -p 8000:5000 --rm t3-console
```

## References 

- [Megatutorial](https://github.com/miguelgrinberg/microblog)
- [t3](https://github.com/atstpls/t3)
