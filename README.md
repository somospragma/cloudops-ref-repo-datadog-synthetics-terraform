# Módulo Terraform: cloudops-ref-repo-datadog-synthetics-terraform

## Descripción:
Este módulo permite configurar y gestionar pruebas sintéticas en Datadog mediante Terraform, facilitando la creación y mantenimiento de monitoreos automatizados para evaluar la disponibilidad y el rendimiento de aplicaciones y servicios. Ideal para implementar monitoreo preventivo que detecte problemas antes de impactar al usuario final.

- Crear pruebas de disponibilidad: Configura y programa pruebas HTTP, TCP, o de URL para monitorear la disponibilidad de endpoints específicos, verificando que estén activos y respondan como se espera.

- Definir alertas personalizadas: Configura umbrales de alertas para recibir notificaciones en caso de falla o lentitud en las pruebas. Esto permite una respuesta rápida ante problemas de rendimiento o disponibilidad.

- Automatizar pruebas de navegación: Realiza pruebas en varios pasos que simulan la experiencia del usuario en una aplicación web. Ideal para monitorear aplicaciones críticas de negocio.

- Configurar frecuencia de pruebas: Permite definir la frecuencia con la que se ejecutarán las pruebas (por ejemplo, cada minuto o cada hora), ajustando el monitoreo según las necesidades del negocio.

- Personalizar ubicaciones de prueba: Selecciona ubicaciones globales o puntos específicos desde donde se ejecutarán las pruebas para simular la experiencia del usuario desde diversas ubicaciones.

- Integración con otros sistemas de notificación: Configura notificaciones a través de canales de Slack, correo electrónico, o webhook cuando se detecten errores en las pruebas.

- Documentación de resultados y métricas de pruebas: Genera y almacena automáticamente informes de cada prueba, incluyendo detalles de latencia, tiempos de respuesta y errores encontrados.

Consulta CHANGELOG.md para la lista de cambios de cada versión. *Recomendamos encarecidamente que en tu código fijes la versión exacta que estás utilizando para que tu infraestructura permanezca estable y actualices las versiones de manera sistemática para evitar sorpresas.*

## Estructura del Módulo
El módulo cuenta con la siguiente estructura:

```bash
cloudops-ref-repo-aws-vpc-terraform/
├── CHANGELOG.md
├── data.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── README.md
├── variables.tf
└── sample/
    ├── data.tf
    ├── main.tf
    ├── outputs.tf
    ├── terraform.tfvars.sample
    └── variables.tf
```

- Los archivos principales del módulo (`data.tf`, `main.tf`, `outputs.tf`, `variables.tf`, `providers.tf`) se encuentran en el directorio raíz.
- `CHANGELOG.md` y `README.md` también están en el directorio raíz para fácil acceso.
- La carpeta `sample/` contiene un ejemplo de implementación del módulo.

## Seguridad & Cumplimiento
 
Consulta a continuación la fecha y los resultados de nuestro escaneo de seguridad y cumplimiento.

<!-- BEGIN_BENCHMARK_TABLE -->
| Benchmark | Date | Version | Description | 
| --------- | ---- | ------- | ----------- | 
| ![checkov](https://img.shields.io/badge/checkov-passed-green) | 2023-09-20 | 3.2.232 | Escaneo profundo del plan de Terraform en busca de problemas de seguridad y cumplimiento |
<!-- END_BENCHMARK_TABLE -->

```hcl
sample/providers.tf
provider "datadog" {
  alias = "principal"
  # ... otras configuraciones del provider
}

sample/synthetics/main.tf
module "synthetics" {
  source = ""
  providers = {
    datadog.project = aws.principal
  }
  # ... resto de la configuración
}
```

## Uso del Módulo:

```hcl
module "synthetics" {
  source = ""
  
  providers = {
    datadog.principal = datadog.principal
  }

  # Common configuration 
  project                   = observability
  environment               = dev
  datadog_app_key           = "xxxxxxxxxxxxxxxxxxxxxxxx"
  datadog_api_key           = "xxxxxxxxxxxxxxxxxxxxxxxx"
  datadog_api_url           = "https://api.datadoghq.com/"
  client                    = Pragma
  common_tags = {
    environment   = "dev"
    project-name  = "proyecto01"
    cost-center   = "xxxxxx"
    owner         = "xxxxxx"
    area          = "xxxxxx"
    provisioned   = "xxxxxx"
    datatype      = "xxxxxx"
  }

    synthetics_browser_config = [
      {
        name       = "xxxxxx"
        type       = "xxxxxx"
        status     = "xxxxxx"
        message    = "xxxxxx"
        device_ids = ["xxxxxx"] 
        locations  = ["xxxxxx","xxxxxx","xxxxxx"]
        tags       = []
    
        request_definition = {
          method = "xxxxxx"
          url    = "xxxxxx"
        }
    
        browser_step = {
          {
            name = "xxxxxx"
            type = "xxxxxx"
            params = [
              {
                check = "xxxxxx"
                value = "xxxxxx"
              }
            ]      
          }
        }
        browser_variable = {
          {
            type    = "xxxxxx"
            id      = "xxxxxx"
            name    = "xxxxxx"
            pattern = "xxxxxx"
            secure  = "xxxxxx"
          },
          {
            type    = "xxxxxx"
            id      = "xxxxxx"
            name    = "xxxxxx"
            pattern = "xxxxxx"
            secure  = "xxxxxx"
          }
        }
        options_list = {
          tick_every = "xxxxxx"
        }
      }
    ]
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_datadog"></a> [aws](#requirement\_datadog) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="requirement_datadog"></a> [aws](#requirement\_datadog) | >= 5.0 |

## Resources

| Name | Type |
|------|------|
| [datadog_synthetics_global_variable](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_global_variable) | resource |
| [datadog_synthetics_test](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_test) | resource |
