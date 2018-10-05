#!/bin/bash
TOEKN=""
for year in {2011..2018}
do
    echo "requesting consultaEmpenhos in year $year month"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultaEmpenhos?anoEmpenho=${year}&mesEmpenho=12&codOrgao=16&numPagina="{1..61} -o empenhos_${year}_dezembro.json
done
