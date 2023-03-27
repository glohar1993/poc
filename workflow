name: RDS Backup

on:
  workflow_dispatch:
    inputs:
      instance-id:
        description: 'The identifier of the RDS instance to back up'
        required: true
      region:
        description: 'The AWS region where the RDS instance is located'
        required: true
      snapshot-name:
        description: 'The name of the snapshot to create'
        required: true

jobs:
  backup:
    runs-on: ubuntu-latest
    steps:
      - name: Send request to GitHub proxy server
        uses: myorg/send-request@v1
        with:
          url: 'https://github-proxy-server.example.com/backup'
          data: '{"instanceId":"$INSTANCE_ID","region":"$REGION","snapshotName":"$SNAPSHOT_NAME"}' 
