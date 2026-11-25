# VisualBase API Gateway | Integration key examples

This public developer sample shows how an authorized integration sends a VisualBase tenant key to an HTTPS endpoint configured to accept it. The gateway and customer deployments are maintained separately.

يوضّح هذا المثال طريقة استخدام مفتاح تكامل خاص بالجهة لإرسال طلب قراءة إلى مسار مفعّل في VisualBase. يمكن لمسؤول الجهة إدارة المفاتيح من الاستوديو.

[Manage integration keys in VisualBase Studio](https://studio.visualbase.com/integration-keys)

## Try a read request

1. Sign in to Studio, select your tenant and issue a key with the required scope. For an enabled gateway route, the relevant scope is `gateway:access`. The `packages:read` scope is for the package feed.
2. Obtain the full HTTPS URL of a read endpoint configured for your integration from the service owner. The Studio management page is a browser UI.
3. In PowerShell 7, run the commands below. The example prompts for the key without echoing it and sends it in the `X-API-Key` header. Use the endpoint's normal authentication and tenant requirements as documented for that route.

```powershell
$endpoint = Read-Host 'Approved gateway GET endpoint (HTTPS)'
.\Invoke-VisualBaseGateway.ps1 -Endpoint $endpoint
```

The command prints the response from the chosen endpoint. A key alone does not enable an unconfigured route or grant additional user permissions. For a rejected request, check the endpoint, tenant, required scope, expiry and revocation with your administrator.
