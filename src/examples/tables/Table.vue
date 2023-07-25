<script setup>
defineProps({
  headers: {
    type: Array,
    default: () => ["Title", "Description","Status"],
  },
  rows: {
    type: Array,
    required: true,
    title: String,
    description: String,
    status: Boolean,
  },
});
</script>
<template>
  <section class="pt-5 mt-5">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="card">
            <div class="table-responsive">
              <table class="table align-items-center mb-0">
                <thead>
                  <tr>
                    <th
                      v-for="(header, index) in headers"
                      :key="header"
                      class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                      :class="{ 'ps-2': index == 1, 'text-center': index > 1 }"
                    >
                      {{ header }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(
                      {
                        title,
                        description,
                        status,
                      },
                      index
                    ) of rows"
                    :key="index"
                  >
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div class="d-flex flex-column justify-content-center">
                          <h6 class="mb-0 text-xs">{{ title }}</h6>
                          <p class="text-xs text-secondary mb-0">
                          </p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <p class="text-xs font-weight-bold mb-0">{{ description }}</p>
                    </td>
                    <td class="align-middle text-center text-sm">
                      <span
                        class="badge badge-sm"
                        :class="status ? 'badge-success' : 'badge-secondary'"
                        >{{ status ? "Done" : "In progress" }}</span
                      >
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
