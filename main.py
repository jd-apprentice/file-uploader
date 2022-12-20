#!/usr/bin/env python3
import json
import webbrowser

def read_json(path="response.json"):
    try:
        with open(path, mode="rt") as file:
            return json.load(file)
    except IOError:
        print("Error: Could not open file")
        return {}

def print_file_url(json_data):
    url = json_data.get("data", {}).get("file", {}).get("url", {}).get("full")
    if url:
        print(url)
        webbrowser.open(url)
    else:
        print("Could not find file")

if __name__ == "__main__":
    json_data = read_json()
    print_file_url(json_data)
