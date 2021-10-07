bucketname=`cat bucketname`
cd ../lambda-go
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main main.go
zip lambda-go.zip main
echo 'Please type version :'
read version
aws s3 cp lambda-go.zip s3://$bucketname/v$version/lambda-go.zip
