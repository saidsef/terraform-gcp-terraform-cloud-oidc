resource "google_service_account" "sa" {
  account_id   = var.pool_id
  description  = format("Service account used by %s", var.pool_id)
  display_name = var.pool_id
  project      = var.project_id

  depends_on = [google_project_service.service]
}

resource "google_project_iam_member" "sa" {
  for_each = toset(local.service_account_roles)

  member  = "serviceAccount:${google_service_account.sa.email}"
  project = var.project_id
  role    = each.key
}

resource "google_service_account_iam_member" "principal" {
  for_each = zipmap([for repo in var.projects : repo.project], var.projects)

  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/attribute.full_workspace/organization:${var.organisation}:project:${each.value.project}:workspace:${each.value.workspace}"
  role               = "roles/iam.workloadIdentityUser" # This role is the only required for the principal
  service_account_id = google_service_account.sa.name
}
