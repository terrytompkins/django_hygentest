import json
import subprocess

def generate_urls(models):
    subprocess.run(['hygen', 'url', 'new', '--app', 'retail_store', '--models', json.dumps(models)])

def main():
    with open('full-model.json') as file:
        data = json.load(file)
        generate_urls(data['models'])

if __name__ == "__main__":
    main()
