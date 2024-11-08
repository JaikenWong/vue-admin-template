<template>
  <div id="multi-step-form-container">
    <h1>创建鲁棒性评估任务</h1>
    <ul ref="formStepperListRef" class="form-stepper form-stepper-horizontal">
      <li v-for="step in steps" :key="step.id" :class="getStepClass(step.number)" :step="step.number">
        <a class="mx-auto">
          <span class="form-stepper-circle">{{ step.number }}</span>
          <div class="label">{{ step.title }}</div>
        </a>
      </li>
    </ul>
    <div v-for="step in steps" :key="step.id" ref="formStepRefs" class="form-step"
      :class="{ 'd-none': !isActiveStep(step.number) }">
      <h2>{{ step.title }}</h2>
      <form @submit.prevent="submitForm(step.number)">
        <!-- 根据步骤号渲染不同的表单内容 -->
        <template v-if="step.number === 1">
          <div class="mb-3">
            <label for="inputName">任务名称</label>
            <input type="text" class="form-control" id="inputName" v-model="formData.name">

            <label for="inputName">任务描述</label>
            <input type="text" class="form-control" id="inputName" v-model="formData.name">
          </div>
        </template>
        <template v-if="step.number === 2">
          <div class="mb-3">
            <label for="inputEmail">场景名称</label>
            <input type="email" class="form-control" id="inputEmail" v-model="formData.email">

            <label for="inputEmail">数据集选择</label>
            <input type="email" class="form-control" id="inputEmail" v-model="formData.email">

          </div>
        </template>
        <template v-if="step.number === 3">
          <div class="mb-3">
            <label for="inputMessage">Message</label>
            <textarea class="form-control" id="inputMessage" rows="3" v-model="formData.message"></textarea>
          </div>
        </template>
        <template v-if="step.number === 3">
          <button type="submit" class="button submit-btn mt-3">Submit</button>
        </template>
        <template v-if="step.number < 3">
          <button type="submit" class="button submit-btn mt-3">Next</button>
        </template>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Tasks',
  data() {
    return {
      steps: [
        { id: 1, number: 1, title: '任务信息' },
        { id: 2, number: 2, title: '测评配置' },
        { id: 3, number: 3, title: '测评策略' },
        { id: 4, number: 4, title: '测评过程' },
        { id: 5, number: 5, title: '测评结果' },
      ],
      activeStep: 1,
      formData: {
        task: {
          name: '',
          description: ''
        },
        name: '',
        email: '',
        message: '',
      },
    };
  },
  methods: {
    getStepClass(stepNumber) {
      const classes = ['form-stepper-unfinished'];
      if (this.activeStep === stepNumber) {
        classes.push('form-stepper-active');
      } else if (stepNumber < this.activeStep) {
        classes.push('form-stepper-completed');
      }
      return classes.join(' ');
    },
    isActiveStep(stepNumber) {
      return this.activeStep === stepNumber;
    },
    submitForm(stepNumber) {
      if (stepNumber < this.steps.length) {
        this.activeStep = stepNumber + 1;
      } else {
        console.log('Form submitted:', this.formData);
      }
    },
  },
};
</script>

<style scoped>
h1 {
  text-align: center;
}

h2 {
  margin: 0;
}

#multi-step-form-container {
  margin-top: 5rem;
}

.text-center {
  text-align: center;
}

.mx-auto {
  margin-left: auto;
  margin-right: auto;
}

.pl-0 {
  padding-left: 0;
}

.button {
  padding: 0.7rem 1.5rem;
  border: 1px solid #4361ee;
  background-color: #4361ee;
  color: #fff;
  border-radius: 5px;
  cursor: pointer;
}

.submit-btn {
  border: 1px solid #0e9594;
  background-color: #0e9594;
}

.mt-3 {
  margin-top: 2rem;
}

.d-none {
  display: none;
}

a.mx-auto {
  text-align: center;
}

.form-step {
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 20px;
  padding: 3rem;
}

.font-normal {
  font-weight: normal;
}

ul.form-stepper {
  counter-reset: section;
  margin-bottom: 3rem;
}

ul.form-stepper .form-stepper-circle {
  position: relative;
}

ul.form-stepper .form-stepper-circle span {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translateY(-50%) translateX(-50%);
}

.form-stepper-horizontal {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
}

ul.form-stepper>li:not(:last-of-type) {
  margin-bottom: 0.625rem;
  -webkit-transition: margin-bottom 0.4s;
  -o-transition: margin-bottom 0.4s;
  transition: margin-bottom 0.4s;
}

.form-stepper-horizontal>li:not(:last-of-type) {
  margin-bottom: 0 !important;
}

.form-stepper-horizontal li {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
  -webkit-box-align: start;
  -ms-flex-align: start;
  align-items: start;
  -webkit-transition: 0.5s;
  transition: 0.5s;
}

.form-stepper-horizontal li:not(:last-child):after {
  position: relative;
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
  height: 1px;
  content: "";
  top: 32%;
}

.form-stepper-horizontal li:after {
  background-color: #dee2e6;
}

.form-stepper-horizontal li.form-stepper-completed:after {
  background-color: #4da3ff;
}

.form-stepper-horizontal li:last-child {
  flex: unset;
}

ul.form-stepper li a .form-stepper-circle {
  display: inline-block;
  width: 40px;
  height: 40px;
  margin-right: 0;
  line-height: 1.7rem;
  text-align: center;
  background: rgba(0, 0, 0, 0.38);
  border-radius: 50%;
  padding: 6px 0;
}

.form-stepper .form-stepper-active .form-stepper-circle {
  background-color: #4361ee !important;
  color: #fff;
}

.form-stepper .form-stepper-active .label {
  color: #4361ee !important;
}

.form-stepper .form-stepper-active .form-stepper-circle:hover {
  background-color: #4361ee !important;
  color: #fff !important;
}

.form-stepper .form-stepper-unfinished .form-stepper-circle {
  background-color: #f8f7ff;
}

.form-stepper .form-stepper-completed .form-stepper-circle {
  background-color: #0e9594 !important;
  color: #fff;
}

.form-stepper .form-stepper-completed .label {
  color: #0e9594 !important;
}

.form-stepper .form-stepper-completed .form-stepper-circle:hover {
  background-color: #0e9594 !important;
  color: #fff !important;
}

.form-stepper .form-stepper-active span.text-muted {
  color: #fff !important;
}

.form-stepper .form-stepper-completed span.text-muted {
  color: #fff !important;
}

.form-stepper .label {
  font-size: 1rem;
  margin-top: 0.5rem;

}

.form-stepper a {
  cursor: default;
}
</style>
