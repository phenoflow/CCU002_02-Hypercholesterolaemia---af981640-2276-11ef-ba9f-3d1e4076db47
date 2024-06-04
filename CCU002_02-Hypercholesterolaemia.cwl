cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu002_02-hypercholesterolaemia-combined---primary:
    run: ccu002_02-hypercholesterolaemia-combined---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  ccu002_02-hypercholesterolaemia-hypercholesterolemia---primary:
    run: ccu002_02-hypercholesterolaemia-hypercholesterolemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_02-hypercholesterolaemia-combined---primary/output
  ccu002_02-hypercholesterolaemia-lipoprotein---primary:
    run: ccu002_02-hypercholesterolaemia-lipoprotein---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_02-hypercholesterolaemia-hypercholesterolemia---primary/output
  ccu002_02-hypercholesterolaemia-fredrickson---primary:
    run: ccu002_02-hypercholesterolaemia-fredrickson---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_02-hypercholesterolaemia-lipoprotein---primary/output
  genetic-ccu002_02-hypercholesterolaemia---primary:
    run: genetic-ccu002_02-hypercholesterolaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-hypercholesterolaemia-fredrickson---primary/output
  ccu002_02-hypercholesterolaemia-apolipoprotein---primary:
    run: ccu002_02-hypercholesterolaemia-apolipoprotein---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: genetic-ccu002_02-hypercholesterolaemia---primary/output
  familial-ccu002_02-hypercholesterolaemia---primary:
    run: familial-ccu002_02-hypercholesterolaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_02-hypercholesterolaemia-apolipoprotein---primary/output
  homozygous-ccu002_02-hypercholesterolaemia---primary:
    run: homozygous-ccu002_02-hypercholesterolaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: familial-ccu002_02-hypercholesterolaemia---primary/output
  ccu002_02-hypercholesterolaemia-hyperlipidemia---primary:
    run: ccu002_02-hypercholesterolaemia-hyperlipidemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: homozygous-ccu002_02-hypercholesterolaemia---primary/output
  possible-ccu002_02-hypercholesterolaemia---primary:
    run: possible-ccu002_02-hypercholesterolaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_02-hypercholesterolaemia-hyperlipidemia---primary/output
  heterozygous-ccu002_02-hypercholesterolaemia---primary:
    run: heterozygous-ccu002_02-hypercholesterolaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: possible-ccu002_02-hypercholesterolaemia---primary/output
  ccu002_02-hypercholesterolaemia-hypertriglyceridemia---primary:
    run: ccu002_02-hypercholesterolaemia-hypertriglyceridemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: heterozygous-ccu002_02-hypercholesterolaemia---primary/output
  primary-ccu002_02-hypercholesterolaemia---primary:
    run: primary-ccu002_02-hypercholesterolaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ccu002_02-hypercholesterolaemia-hypertriglyceridemia---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: primary-ccu002_02-hypercholesterolaemia---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
