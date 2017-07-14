{{- define "seal" }}
- name: sealbot
  image: "{{ .Values.seal.image.repository }}:{{ .Values.seal.image.tag }}"
  imagePullPolicy: {{ .Values.seal.image.pullPolicy }}
  command: ["crond"]
  args: ["-c", "/etc/cron.d", "-f", "-d", "1"]
  volumeMounts:
  - mountPath: /etc/cron.d
    name: seal-crontab
    readOnly: true
  - mountPath: /usr/src/app/crontabs
    name: seal-scripts
    readOnly: true
  resources:
{{ toYaml .Values.resources | indent 10 }}
{{- end }}