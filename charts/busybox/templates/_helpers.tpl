
{{- define "image" -}}
{{- printf "%s:%s" .Values.container.image .Values.container.tag -}}
{{- end}}