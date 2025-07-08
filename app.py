from flask import Flask, request
from datetime import datetime
import os
import json

app = Flask(__name__)
UPLOAD_FOLDER = 'images'
METADATA_FOLDER = 'metadata'

os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(METADATA_FOLDER, exist_ok=True)

@app.route('/', methods=['GET'])
def index():
    return open('index.html').read()

@app.route('/upload', methods=['POST'])
def upload():
    image = request.files.get('image')
    metadata = request.form.get('metadata')

    if image:
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        image_path = os.path.join(UPLOAD_FOLDER, f'snapshot_{timestamp}.png')
        meta_path = os.path.join(METADATA_FOLDER, f'data_{timestamp}.json')

        image.save(image_path)

        data = {
            'client_ip': request.remote_addr,
            'metadata': json.loads(metadata) if metadata else {},
            'timestamp': timestamp
        }

        with open(meta_path, 'w') as f:
            json.dump(data, f, indent=2)

        return 'Uploaded', 200

    return 'No image', 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
