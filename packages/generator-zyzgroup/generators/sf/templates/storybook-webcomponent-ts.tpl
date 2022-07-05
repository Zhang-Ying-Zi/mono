// <%= fileName %>.stories.ts

import { Story, Meta } from '@storybook/web-components';
import { html } from 'lit-html';
import { styleMap } from 'lit-html/directives/style-map.js';

import { <%= fileName %> } from './<%= fileName %>';
import './<%= fileName %>.css';

interface <%= fileName %>Props {
  primary?: boolean;
  backgroundColor?: string;
  size?: 'small' | 'medium' | 'large';
  label: string;
  onClick?: () => void;
}

const Button = ({ primary, backgroundColor = null, size, label, onClick }: ButtonProps) => {
  const mode = primary ? 'storybook-button--primary' : 'storybook-button--secondary';

  return html`
    <button
      type="button"
      class=${['storybook-button', `storybook-button--${size || 'medium'}`, mode].join(' ')}
      style=${styleMap({ backgroundColor })}
      @click=${onClick}
    >
      ${label}
    </button>
  `;
};

export default {
  title: 'COMPONENTS/<%= fileName %>',
  argTypes: {
    backgroundColor: { control: 'color' },
    onClick: { action: 'onClick' },
    size: {
      control: { type: 'select' },
      options: ['small', 'medium', 'large'],
    },
  },
  parameters: {
    backgrounds: {
      values: [
        { name: 'red', value: '#f00' },
        { name: 'green', value: '#0f0' },
        { name: 'blue', value: '#00f' },
      ],
    },
  },
} as Meta;

const Template: Story<<%= fileName %>Props> = (args) => <%= fileName %>(args);

export const Primary = Template.bind({});
Primary.args = {
  primary: true,
  label: 'Button',
};
Primary.storyName = 'rename primary';

export const Secondary = Template.bind({});
Secondary.args = {
  label: 'Button',
};

export const Large = Template.bind({});
Large.args = {
  size: 'large',
  label: 'Button',
};

export const Medium = Template.bind({});
Medium.args = {
  size: 'medium',
  label: 'Button',
};

export const Small = Template.bind({});
Small.args = {
  size: 'small',
  label: 'Button',
};