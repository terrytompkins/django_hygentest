import json
import subprocess

def generate_files(models):
    subprocess.run(['hygen', 'view', 'new', '--app', 'retail_store', '--models', json.dumps(models)])
    subprocess.run(['hygen', 'form', 'new', '--app', 'retail_store', '--models', json.dumps(models)])

def main():
    with open('models.json') as file:
        data = json.load(file)
        generate_files(data['models'])

if __name__ == "__main__":
    main()
