
JDG_ROUTE=http://$(oc get route datagrid-app -o template --template='{{.spec.host}}')

i=1;
while [ $i -le 2000 ]
do 
  curl -X POST -i -H "Content-type:application/json" -d "{\"Value $i\"}" $JDG_ROUTE/rest/mycache/$i;
  (( i++ ))
  echo "value of i is = $i";
  sleep 0.1;
done
