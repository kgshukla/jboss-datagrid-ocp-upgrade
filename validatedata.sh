
JDG_NEW_URL=http://$(oc get route datagrid-new -o template --template='{{.spec.host}}')

i=1;
value='Value';
while [ $i -le 2000 ]
do 
  data="$(curl -i -H "Accept:application/json" $JDG_NEW_URL/rest/mycache/$i)"
  #echo $data;
  if [[ $data == *"$value"* ]]; then
    (( i++ ))
  else
    echo "value not found for key = $i";
    exit;
  fi

echo "All keys found in cache";
done
