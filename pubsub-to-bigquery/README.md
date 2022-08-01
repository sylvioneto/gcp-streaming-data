# Pub/sub to BigGuery streaming

## Description

This example demonstrates how to configure a Serverless data streaming solution using Pub/sub to BigQuery.

Resources created:
- BigQuery data sets and tables
- Pub/sub topic and BQ subscription

## Deploy

1. Create a new project and select it
2. Open Cloud Shell and ensure the env var below is set, otherwise set it with `gcloud config set project` command
```
echo $GOOGLE_CLOUD_PROJECT
```

3. Create a bucket to store your project's Terraform state
```
gsutil mb gs://$GOOGLE_CLOUD_PROJECT-tf-state
```

4. Enable the necessary APIs
```
gcloud services enable 
    bigquery.googleapis.com \
    bigquerydatatransfer.googleapis.com \
    storage.googleapis.com \
    cloudfunctions.googleapis.com \
    pubsub.googleapis.com
```

5. Go to [IAM](https://console.cloud.google.com/iam-admin/iam) and add `Editor`, `Network Admin` and `Security Admin` role to the Cloud Build's service account `<PROJECT_NUMBER>@cloudbuild.gserviceaccount.com`.

6. Clone this repo
```
git clone https://github.com/sylvioneto/gcp-data-analytics.git
cd ./gcp-data-analytics/pubsub-to-bigquery
```

7. Execute Terraform using Cloud Build
```
gcloud builds submit ./terraform --config cloudbuild.yaml
```

## Destroy
1. Execute Terraform using Cloud Build
```
cd ./terraform_gcp/composer
gcloud builds submit ./terraform --config cloudbuild_destroy.yaml
```