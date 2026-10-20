# LAPIS 2026 — Repositorios y Entorno de Software para Prácticos

Guía de configuración del entorno estándar de Python, instrucciones de los proyectos y repositorios de cada profesor para las prácticas de la escuela **[XII LAPIS 2026](https://congresos.unlp.edu.ar/xiilapis2026/softwares-and-catalogues/)**.

---

## 1. Inicio Rápido: Clonar Todo el Repositorio de la Escuela e Instalar el Entorno

Para descargar **todos** los repositorios de los profesores y sus submódulos de una sola vez:

```bash
git clone --recurse-submodules https://github.com/LAPIS-2026/LAPIS-2026.git
cd LAPIS-2026
```

*(Si ya clonaste el repositorio sin `--recurse-submodules`, inicializa y descarga todos los submódulos anidados ejecutando `git submodule update --init --recursive`).*

Una vez dentro de `LAPIS-2026/`, crea y activa el entorno estándar de la escuela a partir de [`lapis2026.yaml`](./lapis2026.yaml) usando **Conda** o **Mamba** (recomendado [Miniforge](https://github.com/conda-forge/miniforge)):

```bash
conda env create -f lapis2026.yaml
conda activate lapis2026
python -m ipykernel install --user --name lapis2026 --display-name "Python (LAPIS 2026)"
```

*(Si tienes `mamba` instalado, puedes usar `mamba env create -f lapis2026.yaml` para una instalación más rápida).*

---

## 2. Estructura de Directorios, Instrucciones (Google Drive) y Recursos por Profesor

Cada profesor cuenta con su propio directorio/submódulo dentro de [`LAPIS-2026`](https://github.com/LAPIS-2026/LAPIS-2026) (que también puede clonarse de forma individual desde [`@LAPIS-2026`](https://github.com/LAPIS-2026)):

| Profesor/a | Directorio / Repo | Instrucciones del Práctico | Software, Datos y Requisitos Previos |
| :--- | :--- | :--- | :--- |
| **Prof. Amina Helmi** | [`aminahelmi/`](./aminahelmi) | [Descripción del proyecto (Drive)](https://drive.google.com/file/d/1VS7VQuLhsBE84s6EhljcN_0PydGDXkS0/view?usp=sharing) | Submódulo [`IOM_clustering`](https://github.com/SofieLovdal/IOM_clustering). **Crear cuenta previa** en Gaia Archive / Gaia DataLab. |
| **Prof. David Cerdeño** | [`davidcerdeno/`](./davidcerdeno) | [Descripción del proyecto (Drive)](https://drive.google.com/file/d/1Yolh2rlnA2oWj7c9BB_FPYhOuzrthl4S/view?usp=sharing) | Detección directa de materia oscura (espectros de retroceso en Xe / LZ). |
| **Prof. Celeste Parisi** | [`celesteparisi/`](./celesteparisi) | [Descripción del proyecto (Drive)](https://drive.google.com/file/d/1rmb1D3DQWjUif6HOHRlrk4chEcl-mfbV/view?usp=sharing) | Submódulo [`pyraf`](https://github.com/iraf-community/pyraf) (R, IRAF/PyRAF). Datos provistos por la profesora. |
| **Prof. Ivanna Escala** | [`ivaescala/`](./ivaescala) | [Ver `ivaescala/README.md`](./ivaescala/README.md) | Submódulos [`VICE`](https://github.com/giganano/VICE), [`emcee`](https://github.com/dfm/emcee), [`dynesty`](https://github.com/joshspeagle/dynesty). Datos provistos por la profesora. |
| **Prof. Facundo Gómez** | [`facundogomez/`](./facundogomez) | [Ver `facundogomez/README.md`](./facundogomez/README.md) | Plataforma y datos en [`tng-project.org/data`](https://www.tng-project.org/data/) (`pytng`, `illustris_python`). **Crear cuenta previa** en IllustrisTNG. |
| **Prof. Peter Ferguson** | [`peterfergusson/`](./peterfergusson) | [Presentación del proyecto (Slides)](https://docs.google.com/presentation/d/1MLxs_F3bKFGd5GNdTyNYLsvzYCQTEW1aZ0Ug6bJgcmI/edit?slide=id.h1f697737480ac276_0_0#slide=id.h1f697737480ac276_0_0) | Catálogo [DES Y6 Gold (LSDB)](http://data.lsdb.io/DES/DES_Y6_Gold_\(US-West%2C_HTTP\)). |
| **Prof. Cecilia Mateu** | [`ceciliamateu/`](./ceciliamateu) | [Ver `ceciliamateu/README.md`](./ceciliamateu/README.md) | Submódulo [`rrl_completeness`](https://github.com/cmateu/rrl_completeness). Datos provistos por la profesora. |
| **Prof. Antonela Monachesi** | [`antonelamonachesi/`](./antonelamonachesi) | [Ver `antonelamonachesi/README.md`](./antonelamonachesi/README.md) | Submódulo [`pyds9plugin`](https://github.com/vpicouet/pyds9plugin), Python y DS9. Imágenes HST y catálogos GHOSTS. |
| **Prof. Nicolás Garavito** | [`nicolasgaravito/`](./nicolasgaravito) | [Ver `LAPIS26/README.md`](./nicolasgaravito/LAPIS26/README.md) | Submódulo [`LAPIS26`](https://github.com/jngaravitoc/LAPIS26) (`Agama`, `nbody_streams`). |
| **Prof. Rodrigo Ibata** | [`rodrigoibata/`](./rodrigoibata) | [Ver `rodrigoibata/README.md`](./rodrigoibata/README.md) | Datos y software disponibles mediante **Google Colab** (`AI-Kepler`, `LeMondeModèle`, `Symplectomania`). |

---

## 3. Contenido del Entorno (`lapis2026.yaml`) y Paquetes Compilados

El archivo [`lapis2026.yaml`](./lapis2026.yaml) instala la pila astrofísica, de dinámica galáctica y de ciencia de datos requerida por los cursos (`numpy`, `scipy`, `matplotlib`, `pandas`, `jupyter`, `corner`, `astropy`, `astroquery`, `gala`, `galpy`, `scikit-learn`, `scikit-image`, `healpy`, `healsparse`, `photutils`, `regions`, `astroplan`, `h5py`, `numba`, `emcee`, `dynesty`, `iraf`, `pyraf`, `r-base`, `r-irkernel`, `pytng`, `illustris_python`, `lsdb`, `galstreams`, `dustmaps`, `astroML`, `vice`, `nbody_streams` y `rrl_completeness`).

Una vez activado el entorno (`conda activate lapis2026`), ejecuta los siguientes pasos adicionales según las prácticas que vayas a realizar:

### A. Compilar `Agama` (Práctico Prof. Nicolás Garavito)
`Agama` requiere que `numpy` y `gsl` ya estén presentes en el entorno antes de compilarse:

```bash
pip install --no-build-isolation -v \
    "agama @ git+https://github.com/GalacticDynamics-Oxford/Agama.git" \
    --config-settings --build-option=--yes
```

Puedes verificar la instalación del práctico de Nicolás Garavito ejecutando:

```bash
python nicolasgaravito/LAPIS26/check_install.py
```

### B. Instalar `pyds9plugin` en modo editable (Práctico Prof. Antonela Monachesi)

*(Nota: `rrl_completeness` de la Prof. Cecilia Mateu ya se instala automáticamente en modo editable al crear el entorno con `lapis2026.yaml`).*

Para instalar el plug-in de DS9 de la Prof. Antonela Monachesi usando las dependencias ya presentes en el entorno:

```bash
# DS9 Quick-Look plug-in (Prof. Antonela Monachesi)
pip install --no-deps -e ./antonelamonachesi/pyds9plugin
```

### C. Nota para `IOM_clustering` (Prof. Amina Helmi)
El código de [`aminahelmi/IOM_clustering`](./aminahelmi/IOM_clustering) utiliza `vaex==4.16.0`, el cual requiere **Python 3.10**. Si necesitas ejecutar los notebooks con `vaex`, puedes crear un entorno ligero dedicado con:

```bash
conda create -n lapis2026-vaex -c conda-forge python=3.10 vaex=4.16.0 hdbscan scipy matplotlib jupyter ipykernel
conda activate lapis2026-vaex
python -m ipykernel install --user --name lapis2026-vaex --display-name "Python 3.10 (Vaex - IOM_clustering)"
```

---

## 4. Clonar el Repositorio de un Solo Profesor (Opcional)

Si solo deseas clonar el repositorio de un profesor en particular junto con sus submódulos:

```bash
git clone --recurse-submodules https://github.com/LAPIS-2026/<profesor>.git
```
