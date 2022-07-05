<!-- <%= fileName %>.stories.mdx -->

import { useState } from 'react';
import { Canvas, Meta, Story } from '@storybook/addon-docs';
import { <%= fileName %> } from './<%= fileName %>';

<Meta title="COMPONENTS/<%= fileName %>" component={<%= fileName %>} />

<style>
  {`
    // css add here
  `}
</style>

export const Template = (args) => <<%= fileName %> {...args } />

<Story
  name="positive"
  args={{
    status: 'positive',
    label: 'Positive'
  }}>
  {Template.bind({})}
</Story>

<Canvas>
  <Story 
    name="negative"
    args={{
      status: 'negative', 
      label: 'Negative'
    }}>
    {Template.bind({})}
  </Story>
</Canvas>

<Canvas>
  <Story 
    name="warning"
    args={{
      status: 'warning',
      label: 'Warning' 
    }}>
    {Template.bind({})}
  </Story>
  <Story 
    name="neutral" 
    args={{
      status: 'neutral', 
      label: 'Neutral' 
    }}>
    {Template.bind({})}
  </Story>
  <Story 
    name="error"
    args={{
      status: 'error', 
      label: 'Error' 
    }}>
    {Template.bind({})}
  </Story>
  <Story 
    name="with icon" 
    args={{
      status: 'warning', 
      label: (<Icon icon="check" inline /> with icon)
    )}}>
    {Template.bind({})}
  </Story>
</Canvas>

<Canvas>
  <Story 
    name="Primary"
    args={{
      status: 'positive',
      label: 'Positive'
    }}
  >
    {() => {
      const [value, setValue] = useState('Secondary');
      const [isPrimary, setIsPrimary] = useState(false);
      const handleOnChange = () => {
        if (!isPrimary) {
          setIsPrimary(true);
          setValue("Primary");
        }
      };
      return (
        <<%= fileName %> primary={isPrimary} onClick={handleOnChange} label={value} />
      );
    }}
  </Story>
</Canvas>