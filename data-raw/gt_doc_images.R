# 1. install pkg that will run and save the documentation images
install.packages(
  'gt.doc.images',
  repos = c(ddsjoberg = 'https://ddsjoberg.r-universe.dev',
            CRAN = 'https://cloud.r-project.org')
)

# 2. Install the most recent version of gtsummary

# 3. Restart R to have a fresh R session.
#    No packages should be loaded, not even gtsummary
#    Any object that is in the global environment may be written over!

# 4. Run the function below to save the images created in the help files.
#    Only objects whose named in `_ex` or `_ex[:digit:]+` are saved.
#    Files will be saved to "~/man/figures/<filename>.png", where the filename
#    is the object name, i.e.'tbl_ae_count_ex1.png'. No example object
#    may overlap throughout the entire package.
gt.doc.images::save_help_file_images(pkg = "gtsummary")

# document a single file with
gt.doc.images::save_help_file_images(pkg = "gtsummary",
                                     rd_files = "modify_column_merge.Rd")

# 5. Shrink png files
gt.doc.images::shrink_help_file_images(pkg = "gtsummary")

gt.doc.images::shrink_help_file_images(pkg = "gtsummary", image_files = "tbl_strata_ex1.png")

c("as_kable_extra_ex2_pdf.png", "as_kable_extra_ex3_pdf.png",
  "as_kable_extra_ex1_pdf.png", "as_flex_table_ex1.png") |>
  purrr::walk(~webshot::shrink(here::here("man", "figures", .x)))
