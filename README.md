# 📊 Ventas Tech DB | SQL Data Analytics

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-005571?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github)

## 📖 Descripción

Este proyecto fue desarrollado como parte del curso de **Data Analytics** y tiene como objetivo modelar una base de datos relacional para una empresa de ventas de productos tecnológicos, implementar consultas SQL y obtener información relevante para la toma de decisiones comerciales.

A lo largo del proyecto se aplican conceptos de:

- Modelado de bases de datos relacionales.
- Lenguaje SQL (DDL, DML y consultas analíticas).
- Restricciones de integridad.
- Funciones de agregación.
- JOINs.
- CTE (Common Table Expressions).
- Análisis exploratorio de datos.

---

# 🎯 Objetivos del proyecto

- Diseñar una base de datos relacional.
- Crear tablas con claves primarias y foráneas.
- Cargar datos de prueba.
- Realizar consultas de negocio.
- Obtener KPIs comerciales.
- Analizar el comportamiento de clientes, productos y ventas.

---

# 🛠 Tecnologías utilizadas

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Git
- GitHub

---

# 🗂 Modelo de datos

La base de datos **Ventas_Tech_DB** está compuesta por cuatro tablas relacionadas.

| Tabla | Descripción |
|--------|-------------|
| Categorias | Clasificación de los productos |
| Productos | Catálogo de productos tecnológicos |
| Clientes | Información de clientes registrados |
| Ventas | Historial de ventas realizadas |

### Relaciones

```
Categorias
      │
      │
Productos
      │
      │
Ventas
      │
      │
Clientes
```

Las relaciones se implementan mediante claves primarias (PK) y claves foráneas (FK), garantizando la integridad referencial.

---

# 📂 Estructura del repositorio

```
M3-M4-M5
│
├── M3.sql
│     ├── Creación de la base de datos
│     ├── Creación de tablas
│     ├── Restricciones
│     └── Inserción de datos
│
├── M4.sql
│     ├── KPIs comerciales
│     ├── Consultas analíticas
│     └── Insights de negocio
│
├── M5.sql
│     ├── INNER JOIN
│     ├── LEFT JOIN
│     ├── UNION ALL
│     └── CTE
│
└── README.md
```

---

# 📊 Consultas desarrolladas

## Módulo 3 – Diseño de Base de Datos

✔ Creación de Base de Datos

✔ Creación de Tablas

✔ Claves Primarias

✔ Claves Foráneas

✔ Restricciones de Integridad

✔ Inserción de Datos (DML)

---

## Módulo 4 – Consultas Analíticas

Se desarrollaron consultas para responder preguntas de negocio como:

- Facturación mensual.
- Ticket promedio.
- Cantidad de pedidos.
- Ranking de productos.
- Clientes recurrentes.
- Comparación del rendimiento mensual.

Se aplicaron funciones como:

- SUM()
- AVG()
- COUNT()
- MONTH()
- GROUP BY
- HAVING
- CTE

---

## Módulo 5 – JOINs

Se implementaron distintos tipos de JOIN para responder escenarios habituales del negocio.

### INNER JOIN

Construcción de una vista consolidada que relaciona:

- Ventas
- Clientes
- Productos
- Categorías

### LEFT JOIN

Identificación de:

- Clientes sin compras.
- Productos sin ventas.

### UNION ALL

Consolidación de ventas por canal:

- Online
- Presencial

---

# 📈 Principales KPIs obtenidos

- 💰 Total facturado.
- 🛒 Cantidad de pedidos.
- 🎯 Ticket promedio.
- 📦 Productos con mayor facturación.
- 👥 Clientes recurrentes.
- 📈 Rendimiento mensual.
- 🌐 Facturación por canal de venta.

---

# 💡 Insights de negocio

### 📌 Producto de mayor valor

El producto con ID 1 concentra la mayor facturación del período, representando una oportunidad para potenciar su comercialización mediante campañas específicas y estrategias de venta consultiva.

---

### 📌 Incremento del ticket promedio

El producto con mayor cantidad de unidades vendidas presenta una baja contribución a la facturación, por lo que resulta un buen candidato para acciones de **cross-selling** y **up-selling**.

---

### 📌 Fidelización de clientes

Los clientes recurrentes representan una oportunidad para desarrollar programas de fidelización y promociones segmentadas, con el objetivo de aumentar el valor de vida del cliente (Customer Lifetime Value).

---

# 🚀 Cómo ejecutar el proyecto

1. Clonar este repositorio.

```bash
git clone https://github.com/agustit4/M3-M4-M5.git
```

2. Abrir SQL Server Management Studio.

3. Ejecutar el script **M3.sql** para crear la base de datos y cargar la información inicial.

4. Ejecutar **M4.sql** para obtener los indicadores comerciales.

5. Ejecutar **M5.sql** para analizar las relaciones entre tablas mediante JOINs.

---

# 📚 Conceptos aplicados

- SQL
- DDL
- DML
- PK / FK
- Integridad Referencial
- INNER JOIN
- LEFT JOIN
- UNION ALL
- GROUP BY
- HAVING
- CTE
- Funciones de agregación
- Alias
- Buenas prácticas de escritura SQL

---

# 👩‍💻 Autora

**Agustina Roldán**

Proyecto desarrollado como práctica del curso de **Data Analytics**, con foco en el diseño de bases de datos, consultas SQL y análisis de información para la toma de decisiones.

---

⭐ Si este proyecto te resultó interesante, no dudes en dejar una estrella en el repositorio.
