# eLifeAmbassadors computational reproducibility checklist for reviewers

This checklist has been adopted from the [TOP guidelines](https://cos.io/our-services/top-guidelines/) for reproducibility, described in [this article](http://science.sciencemag.org/content/348/6242/1422.full) and modified to integrate various other editorial policies and guidelines provided by a range of publishers in life sciences. This checklist would evolve with the input of the community. Feedbacks and comments are welcome through the hashtag #eLifeAmbassadors on twitter. For suggestions, please open an issue on this repository.


## Computational reproducibility checklist for reviewers in life sciences

- [ ] **Do the authors report results based on a quantitative analysis? (Either original data or re-analysis of publicly available dataset)**

- [ ] **Does the analysis include writing their own code?**
  - [ ] Do the authors provide program code, scripts, codebooks, and other documentation sufficient to precisely reproduce all published results?
  - [ ] Is code deposited in a standard code hosting repository?
  - [ ] If no, is the code provided in a human AND machine-readable format with the manuscript (i.e. not embedded in pdf, not exclusively as pre-compiled binaries)?
  - [ ] Is the documentation hosted in a standard hosting repository (could be same or different from the code repository)?
  - [ ] Are the provided codes/scripts and documentation version controlled?
  - [ ] Do the authors refer to the version of code/scripts and documentation used in manuscript?

- [ ] **Does the analysis include use of previously published/available software or code?**
  - [ ] Do the authors provide references (citations in case of published work, links in case of unpublished work) for all the softwares used in the analysis?
  - [ ] Do the authors mention version numbers for all the softwares used in the analysis?

- [ ] **Do the results rely on a series of pre-processing and analysis steps?**
  - [ ] Do the authors clearly describe all steps or provide a flow-chart of the steps?
  - [ ] If no, do the authors refer to a pre-existing publicly available workflow?

- [ ] **Advanced:** Do the authors provide code for automated execution of described workflows (eg. snakemake/nextflow workflows)?
- [ ] **Advanced:** Do the authors provide a self-contained workflow execution environment (eg. Docker containers)?
- [ ] **Advanced** Has the code/software provided by the authors been through a code review?

- [ ] **Do the results include analysis of original data?**

  - [ ] Do the authors make the data available at a trusted digital repository*?
  - [ ] Do the authors include all meta-data to reproduce the analysis*?
  - [ ] Do the authors provide a full account of the procedures used to collect, preprocess, clean, or generate the data?
  - [ ] Do the authors provide research materials and description of procedures necessary to conduct an independent replication of the research?


- [ ] **Are there any results based on data or materials that cannot be shared for legal or ethical reasons?**

  - [ ] Do the authors explain the restrictions on the dataset or materials and how they preclude public access?
  - [ ] Do the authors provide a public description of the steps others should follow to request access to the data or materials?
  - [ ] Do the authors provide access to all data and materials for which the constraints do not apply?


**What's a trusted digital repository**
- Trusted repositories adhere to policies that make data discoverable, accessible, usable, and preserved for the long term. Trusted repositories also assign unique and persistent identifiers. Author maintained websites are not compliant with this requirement.
- Note: If all data required to reproduce the reported analyses appears in the article text, tables, and figures then it does not also need to be posted to a repository.

**What's the required meta-data**

Any description of data associated with the results that's important for reproducing the analysis and interpretation of the results described in the manuscript, can be considered meta-data, including but not limited to:
- material type (cells, tissues) and culture/storage conditions
- material extraction protocol (how was the material obtained)
- variables (eg. batches) and treatment conditions
- any other experimental observations that affects the analysis
