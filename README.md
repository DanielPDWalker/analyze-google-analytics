# matatika-datasets-google-analytics

Meltano project [file bundle](https://meltano.com/docs/command-line-interface.html#file-bundle) of Matatika datasets for Google Analytics

Files:
- [`analyze/datasets`](./bundle/analyze/datasets) (directory)

Add plugin to `discovery.yml`:
```yaml
files:
- name: matatika-datasets-google-analytics
  namespace: tap_google_analytics
  update:
    analyze/datasets: true
  repo: https://github.com/Matatika/matatika-datasets-google-analytics
  pip_url: git+https://github.com/Matatika/matatika-datasets-google-analytics.git
```

Add plugin to your Meltano project:
```bash
# Add only the file bundle
meltano add files matatika-datasets-google-analytics

# Add the file bundle as a related plugin through adding the Google Analytics extractor
meltano add extractor --include-related tap-google-analytics
```