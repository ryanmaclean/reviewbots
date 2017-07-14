{{- define "reviewbot" }}
- name: notifierbot
  image: "{{ .Values.notifier.image.repository }}:{{ .Values.notifier.image.tag }}"
  imagePullPolicy: {{ .Values.notifier.image.pullPolicy }}
  env:
  - name: SLACK_API_TOKEN
    value: {{ .Values.notifier.slackToken }}
  - name: MENTIONS_TO_HANDLES
    value: {{ .Values.notifier.handleHash | quote }}
  - name: CHANNEL_IDS
    value: {{ .Values.notifier.slackChannels | quote }}
  resources:
{{ toYaml .Values.resources | indent 10 }}
{{- end }}