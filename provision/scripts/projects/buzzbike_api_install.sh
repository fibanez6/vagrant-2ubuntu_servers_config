#!/usr/bin/env bash

echo "Using " | python --version
echo "-------------------- Installing python extra libraries"
sudo apt-get install -y libgeos-dev libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     libblas-dev libatlas-base-dev

echo "-------------------- Activating virtual environment"
source /home/vagrant/venv/bin/activate
echo "-------------------- Installing project requirements"
cd /home/vagrant/sync/buzzbike-api
pip3 install -r requirements.txt
echo "-------------------- Exporting environment"
export DATABASE_URL="postgresql://buzzbike:buzzbike@172.16.0.15/buzzbike"
export SECRET_KEY='somerandomstring'
export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=admin
export GOOGLE_MAPS_JS_API_KEY=ajskdjaskdjak
export DEBUG=1
export MAIL_SERVER=localhost
export SENDGRID_USERNAME=any
export SENDGRID_PASSWORD=any
export FRONTEND_SERVER_NAME="http://localhost:8080"
export CLOUDAMQP_URL="amqp://localhost"
export MAIL_SUPPRESS_SEND=True
export CELERY_ALWAYS_EAGER=True
export MAILCHIMP_USERNAME=something
export MAILCHIMP_API_KEY=someApiKey
export MAILCHIMP_LIST_ID=someMailchimpList
export ONESIGNAL_API_KEY=someApiKey
export ONESIGNAL_APP_ID=someApiId
export SUPPORT_EMAIL=SUPPORT_EMAIL
export BRAINTREE_MERCHANT_ID=braintreeMerchantId
export BRAINTREE_PUBLIC_KEY=braintreePublicKey
export BRAINTREE_PRIVATE_KEY=braintreePrivateKey
export TEST_DATABASE_URL="postgresql://buzzbike:buzzbike@172.16.0.15/buzzbike-test"

echo "-------------------- Upgrading database"
python manage.py db upgrade
echo "-------------------- Deactivating virtual environment"
deactivate
#python manage.py runserver -h 0.0.0.0 -p 5000