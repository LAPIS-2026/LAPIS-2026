# LAPIS 2026 — Repositorios y Entorno de Software para Prácticos

Guía de configuración del entorno estándar de Python y de los repositorios de cada profesor para las prácticas de la escuela **XII LAPIS 2026**.

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

## 2. Estructura de Directorios y Repositorios por Profesor

Cada profesor cuenta con su propio directorio/submódulo dentro de [`LAPIS-2026`](https://github.com/LAPIS-2026/LAPIS-2026) (que también puede clonarse de forma individual desde [`@LAPIS-2026`](https://github.com/LAPIS-2026)):

| Profesor/a | Directorio / Repo | Submódulos y Recursos Incluidos |
| :--- | :--- | :--- |
| **Prof. Ivana Escala** | [`ivaescala/`](./ivaescala) | [`VICE`](https://github.com/giganano/VICE), [`emcee`](https://github.com/dfm/emcee), [`dynesty`](https://github.com/joshspeagle/dynesty) |
| **Prof. Amina Helmi** | [`aminahelmi/`](./aminahelmi) | [`IOM_clustering`](https://github.com/SofieLovdal/IOM_clustering) |
| **Prof. Cecilia Mateu** | [`ceciliamateu/`](./ceciliamateu) | [`rrl_completeness`](https://github.com/cmateu/rrl_completeness) |
| **Prof. Antonela Monachesi** | [`antonelamonachesi/`](./antonelamonachesi) | [`pyds9plugin`](https://github.com/vpicouet/pyds9plugin) |
| **Prof. Celeste Parisi** | [`celesteparisi/`](./celesteparisi) | [`pyraf`](https://github.com/iraf-community/pyraf) |
| **Prof. Nicolás Garavito** | [`nicolasgaravito/`](./nicolasgaravito) | [`LAPIS26`](https://github.com/jngaravitoc/LAPIS26) (`Agama`, `nbody_streams`) |
| **Prof. Peter Fergusson** | [`peterfergusson/`](./peterfergusson) | Datos DES Y6 Gold: [`data.lsdb.io/DES/DES_Y6_Gold_(US-West,_HTTP)`](http://data.lsdb.io/DES/DES_Y6_Gold_\(US-West%2C_HTTP\)) |
| **Prof. Facundo Gómez** | [`facundogomez/`](./facundogomez) | Datos IllustrisTNG: [`tng-project.org/data`](https://www.tng-project.org/data/) (`pytng`, `illustris_python`) |
| **Prof. David Cerdeño** | [`davidcerdeno/`](./davidcerdeno) | Materiales del práctico |
| **Prof. Rodrigo Ibata** | [`rodrigoibata/`](./rodrigoibata) | Materiales del práctico |

---

## 3. Contenido del Entorno (`lapis2026.yaml`) y Paquetes Compilados

El archivo [`lapis2026.yaml`](./lapis2026.yaml) instala la pila astrofísica y de ciencia de datos estándar (`numpy`, `scipy`, `matplotlib`, `pandas`, `jupyter`, `corner`, `astropy`, `scikit-learn`, `healpy`, `photutils`, `h5py`, `numba`, `emcee`, `dynesty`, `pytng`, `illustris_python`, `lsdb`, `vice`, `pyraf`, `nbody_streams`, etc.).

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

### B. Instalar paquetes locales de los submódulos en modo editable

```bash
# RR Lyrae completeness maps (Prof. Cecilia Mateu)
pip install -e ./ceciliamateu/rrl_completeness

# DS9 Quick-Look plug-in (Prof. Antonela Monachesi)
pip install -e ./antonelamonachesi/pyds9plugin
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

