import boto3
from decimal import Decimal

doc_client = boto3.resource(
    'dynamodb',
    endpoint_url='http://localhost:8000',
    region_name='us-west-2',
    aws_access_key_id='local',
    aws_secret_access_key='local'
)

def put_item():
    table = doc_client.Table('orders')
    table.put_item(
        Item={
            'id': '12347',
            'customerName': 'John Doe',
            'orderDate': '2025-01-23',
            'amount': Decimal(str(250.75))
        }
    )
    print('Item added successfully.')

def get_item(order_id):
    table = doc_client.Table('orders')
    response = table.get_item(Key={'id': order_id})
    item = response.get('Item')
    print('Item retrieved:', item)

if __name__ == '__main__':
    put_item()
    get_item('12347')
    get_item('12346')