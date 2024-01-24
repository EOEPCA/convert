cwlVersion: v1.0
$namespaces:
  s: https://schema.org/
schemas:
  - http://schema.org/version/9.0/schemaorg-current-http.rdf
s:softwareVersion: 0.1.2

$graph:
  # Workflow entrypoint
  - class: Workflow
    doc: Convert URL
    id: convert-url
    label: convert url app
    inputs:
      fn:
        label: the operation to perform
        doc: the operation to perform
        type: string
      url:
        label: the image to convert
        doc: the image to convert
        type: string
      size:
        label: the percentage for a resize operation
        doc: the percentage for a resize operation
        type: string
    outputs:
      - id: wf_outputs
        type: Directory
        outputSource:
          - convert/results
    steps:
      convert:
        run: "#convert"
        in:
          fn: fn
          url: url
          size: size
        out:
          - results

  # convert.sh - takes input args `--url`
  - class: CommandLineTool
    id: convert
    baseCommand: convert.sh
    inputs:
      fn:
        type: string
        inputBinding:
          position: 1
      url:
        type: string
        inputBinding:
          position: 2
          prefix: --url
      size:
        type: string
        inputBinding:
          position: 3
    outputs:
      results:
        type: Directory
        outputBinding:
          glob: .
    requirements:
      DockerRequirement:
        dockerPull: eoepca/convert:latest
      ResourceRequirement:
        coresMax: 1
        ramMax: 512
