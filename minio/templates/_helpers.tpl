{{- define "minio.resources" -}}
resources:
  requests:
{{- with .Values.resources.requests }}
    cpu: {{.cpu}}
    memory: {{.memory}}
{{- end }}
{{- with .Values.resources.limits }}
  limits:
    cpu: {{.cpu}}
    memory: {{.memory}}
{{- end }}
{{- end -}}

{{- define "minio.labels" -}}
labels:
    storage: "S3"
    app: {{ .Values.name|quote}}
{{- end -}}

{{- define "minio.env" -}}
env:
 - name: "MINIO_ROOT_USER"
   value: {{ .Values.credentials.user|quote}}
 - name: "MINIO_ROOT_PASSWORD"
   value: {{ .Values.credentials.password| quote}} 
{{- end -}}

{{- define "minio.args" -}}
args: 
- "server"
- {{ .Values.data_path| quote }}
- "--console-address"
- ":9001"
{{- end -}}


{{- define "test.labels" -}}
labels:
    app: "{{ .Values.name }}-test"
    type: "test"
{{- end -}}