# Módulo Terraform: cloudops-ref-repo-datadog-synthetics-terraform

## Descripción:
Este módulo permite configurar y gestionar pruebas sintéticas en Datadog mediante Terraform, facilitando la creación y mantenimiento de monitoreos automatizados para evaluar la disponibilidad y el rendimiento de aplicaciones y servicios. Ideal para implementar monitoreo preventivo que detecte problemas antes de impactar al usuario final



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