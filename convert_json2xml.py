from json import loads
from dicttoxml import dicttoxml

months = ['01','02','03','04','05','06','07','08','09','10','11','12']

for year in range(2011,2018):
    for month in months:
        file_name = '%s/empenhos_%s_%s' % (year, year, month)
        json_file = '%s.json' % file_name
        with open(json_file, 'r') as readable:
            metadata = readable.read()
        xml_file = dicttoxml(loads(metadata))
        xml_file_name = '%s.xml' % file_name
        with open(xml_file_name, 'wb') as arch:
            arch.write(xml_file)
