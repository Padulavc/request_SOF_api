#!/bin/bash
mkdir consultarModalidades
mkdir consultarReceita
mkdir consultarFuncoes
mkdir consultarElementos
mkdir consultarGrupos
mkdir consultarCategorias
mkdir consultarProgramas
mkdir consultarMovimentosReceita
mkdir consultarProjetosAtividades
mkdir consultarFonteRecursos
mkdir consultarSubFuncoes
mkdir consultarEmpresas
mkdir consultarOrgaos
mkdir consultaEmpenhos
mkdir consultarDespesasCredor
mkdir consultarDespesas
TOKEN=""
echo "requesting consultarCredores"
curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarCredores" > /SOF_crawler/consultarCredores.json
echo "requesting consultaContrato"
curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultaContrato" > /SOF_crawler/consulta_contrato.json
for year in {2003..2018}
do
    echo "requesting consultarModalidades in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarModalidades?anoExercicio=$year" > /SOF_crawler/consultarModalidades/consultar_modalidade$year.json
    echo "requesting consultarContasReceita in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarContasReceita?anoExercicio=$year" > /SOF_crawler/consultarReceita/consultarContasReceita$year.json
    echo "requesting consultarFuncoes in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarFuncoes?anoExercicio=$year" > /SOF_crawler/consultarFuncoes/consultar_funcoes$year.json
    echo "requesting consultarElementos in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarElementos?anoExercicio=$year" > /SOF_crawler/consultarElementos/consultar_elementos$year.json
    echo "requesting consultarGrupos in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarGrupos?anoExercicio=$year" > /SOF_crawler/consultarGrupos/consultar_grupos$year.json
    echo "requesting consultarCategorias in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarCategorias?anoExercicio=$year" > /SOF_crawler/consultarCategorias/consultar_categorias$year.json
    echo "requesting consultarProgramas in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarProgramas?anoExercicio=$year" > /SOF_crawler/consultarProgramas/consultar_programas$year.json
    echo "requesting consultarMovimentosReceita in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarMovimentosReceita?anoExercicio=$year" > /SOF_crawler/consultarMovimentosReceita/consultar_movimentos_receita$year.json
    echo "requesting consultarProjetosAtividades in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarProjetosAtividades?anoExercicio=$year" > /SOF_crawler/consultarProjetosAtividades/consultar_projetos_atividades$year.json
    echo "requesting consultarFonteRecursos in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarFonteRecursos?anoExercicio=$year" > /SOF_crawler/consultarFonteRecursos/consultar_fontes_recursos$year.json
    echo "requesting consultarSubFuncoes in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarSubFuncoes?anoExercicio=$year" > /SOF_crawler/consultarSubFuncoes/consultar_subfuncoes$year.json
    echo "requesting consultarEmpresas in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarEmpresas?anoExercicio=$year" > /SOF_crawler/consultarEmpresas/consultar_empresas$year.json
    echo "requesting consultarOrgaos in year $year"
    curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarOrgaos?anoExercicio=$year" > /SOF_crawler/consultarOrgaos/consultar_orgaos$year.json
    mkdir consultaEmpenhos/consultaEmpenhos$year
    mkdir consultarDespesasCredor/consultarDespesasCredor$year
    mkdir consultarDespesas/consultarDespesas$year
    for month in 01 02 03 04 05 06 07 08  09 10 11 12
    do
        echo "requesting consultaEmpenhos in year $year month $month"
        curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultaEmpenhos?anoEmpenho=$year&mesEmpenho=$month" > /SOF_crawler/mensal/consultaEmpenhos/consultaEmpenhos$year/consultarempenhos_$year_$month.json
        echo "requesting consultarDespesasCredor in year $year month $month"
        curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarDespesasCredor?anoExercicio=$year&mesEmpenho=$month" > /SOF_crawler/mensal/consultarDespesasCredor/consultarDespesasCredor$year/consultar_despesas_credor__$year_$month.json
        echo "requesting consultarDespesas in year $year month $month"
        curl -X GET --header "Accept: application/json" --header "Authorization: Bearer $TOKEN" "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultarDespesas?anoDotacao=$year&mesDotacao=$month" > /SOF_crawler/mensal/consultarDespesas/consultarDespesas$year/consultar_despesas_$year_$month.json
    done
done
