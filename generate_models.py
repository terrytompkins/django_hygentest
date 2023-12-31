import json
import subprocess

def generate_models(models):
    subprocess.run(['hygen', 'model', 'new', '--models', json.dumps(models)])

def main():
    with open('models.json') as file:
        data = json.load(file)
        generate_models(data['models'])

if __name__ == "__main__":
    main()
