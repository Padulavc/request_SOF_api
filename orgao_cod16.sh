#!/bin/bash
TOKEN=""
for year in {2011..2018}
do
    for month in {01..12}
    do
        echo "requesting consultaEmpenhos in year $year month $month"
        curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultaEmpenhos?anoEmpenho=${year}&mesEmpenho=${month}&codOrgao=16" -o empenhos_${year}_${month}.json
        #json2xlsx -j empenhos_${year}_${month}.json -o empenhos_${year}_${month}.xlsx
    done
done