{{/*
//Expand the name of the chart.
*/}}
{{- define "jobmanager.chartName" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jobmanager.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jobmanager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "jobmanager.image" -}}
{{- $registryName :=  .image.registry -}}
{{- $repositoryName := .image.repository -}}
{{- $tag := .image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Labels for jobmanager service
*/}}
{{- define "jobmanager.labels" -}}
{{ template "jobmanager.selectors" . }}
service: jobmanager-{{ .service }}
group: jobmanager
heritage: {{ .root.Release.Service | quote }}
{{- end }}

{{/*
Selectors for jobmanager service
*/}}
{{- define "jobmanager.selectors" -}}
app: {{ include "jobmanager.chartName" .root }}-{{ .service }}
release: {{ .root.Release.Name | quote }}
chart: {{ include "jobmanager.chart" .root | quote }}
{{- end }}
