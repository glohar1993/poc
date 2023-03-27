import sys
import boto3

def create_rds_snapshot(instance_identifier, region, snapshot_name):
    rds = boto3.client('rds', region_name=region)
    response = rds.create_db_snapshot(DBInstanceIdentifier=instance_identifier, DBSnapshotIdentifier=snapshot_name)
    return response

if __name__ == '__main__':
    instance_identifier = sys.argv[1]
    region = sys.argv[2]
    snapshot_name = sys.argv[3]
    
    response = create_rds_snapshot(instance_identifier, region, snapshot_name)
    print(f"Snapshot created: {response['DBSnapshot']['DBSnapshotIdentifier']}") 
