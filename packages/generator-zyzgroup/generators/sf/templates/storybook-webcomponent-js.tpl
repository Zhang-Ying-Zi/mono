// <%= fileName %>.stories.js

// for webcomponent
import { Story, Meta } from '@storybook/web-components';
import { html } from 'lit-html';
import { styleMap } from 'lit-html/directives/style-map.js';
// for interactions
import { expect } from '@storybook/jest';
import { userEvent, waitFor, within } from '@storybook/testing-library';
// load component
import { <%= fileName %> } from './<%= fileName %>';
import './<%= fileName %>.css';

export default {
  title: 'COMPONENTS/<%= fileName %>',
  component: <%= fileName %>,
  decorators: [
    // (story) => html`<div style="margin: 3em">${story()}</div>`
  ],
  parameters: {
    backgrounds: {
      values: [
        { name: 'red', value: '#f00' },
        { name: 'green', value: '#0f0' },
        { name: 'blue', value: '#00f' },
      ],
      // actions: {
      //   handles: ['mouseover', 'click .btn'],
      // },
    },
    docs: {
      // # to remove docs contents
      // page: null,
      // # Write your documentation in MDX
      // page: CustomMDXDocumentation,
      // # Opt-out of inline rendering
      // inlineStories: false,
    },
    controls: { 
    	// hideNoControlsWarning: true,
      // include: ['foo', 'bar'],
      // exclude: ['foo', 'bar'],
      // sort: 'requiredFirst',
    },
  },
  argTypes: {
    onClick: { action: 'onClick' },
    onSubmit: { action: true },
  	backgroundColor: { control: 'color' },
    size: {
      control: { type: 'select' },
      options: ['small', 'medium', 'large'],
    },
    variant: {
      control: { type: 'radio' },
      options: ['primary', 'secondary'],
    },
    // removed the prop documentation from the table
    foo: {
      table: {
        disable: true,
      },
    },
    // render the prop documentation, but without a control
    foo: {
      control: false,
    },

    advanced: { control: 'boolean' },
    // below are only included when advanced is true
    margin: { control: 'number', if: { arg: 'advanced' } },
    padding: { control: 'number', if: { arg: 'advanced' } },
    cornerRadius: { control: 'number', if: { arg: 'advanced' } },

    // button can be passed a label or an image, not both
    label: {
      control: 'text',
      if: { arg: 'image', truthy: false },
    },
    image: {
      control: { type: 'select', options: ['foo.jpg', 'bar.jpg'] },
      if: { arg: 'label', truthy: false },
    },
    // arg	string	The ID of the arg to test.
	  // global	string	The ID of the global to test.
    // truthy	boolean	Is the target value truthy?
    // exists	boolean	Is the target value defined?
    // eq	any	Is the target value equal to the provided value?
    // neq	any	Is the target value NOT equal to the provided value?

    status: {
      name: 'Status',
      description: '',
      options: ['positive', 'negative', 'warning', 'error', 'neutral'],
      table: {
        defaultValue: {
          summary: 'positive',
        },
        type: {
          summary: 'Shows options to the Badge',
          detail: 'Listing of available options',
        },
      },
    },
    label: {
      name: 'Content',
      description: '',
      control: {
        type: 'text',
      },
      table: {
        type: {
          summary: '',
          detail: '',
        },
      },
    },
  },
};

const Template = (args) => <<%= fileName %> {...args} />;

const SampleStory = Template.bind({});
SampleStory.play = async ({ args, canvasElement }) => {
  const canvas = within(canvasElement);

  await userEvent.type(canvas.getByTestId('email'), 'hi@example.com');
  await userEvent.type(canvas.getByTestId('password'), 'supersecret');
  await userEvent.click(canvas.getByRole('button'));

  await waitFor(() => expect(args.onSubmit).toHaveBeenCalled());
};