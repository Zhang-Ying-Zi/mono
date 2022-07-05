// <%= fileName %>.stories.js

import React, { useState } from 'react';
import { <%= fileName %> } from './<%= fileName %>';

export default {
  title: 'COMPONENTS/<%= fileName %>',
  component: <%= fileName %>,
  parameters: {
    layout: 'fullscreen',
  },
  argTypes: {
    backgroundColor: { control: 'color' },
  },
};

const Template = (args) => <<%= fileName %> {...args} />;

export const Primary = () => {
  const [value, setValue] = useState('Secondary');
  const [isPrimary, setIsPrimary] = useState(false);
  const handleOnChange = () => {
    if (!isPrimary) {
      setIsPrimary(true);
      setValue('Primary');
    }
  };
  return <<%= fileName %> primary={isPrimary} onClick={handleOnChange} label={value} />;
};

export const Secondary = Template.bind({});
Secondary.args = {
  primary: true,
  label: '<%= fileName %>',
};


////////////////////////////////// // <%= fileName %>.js sample
// import React from 'react';
// import PropTypes from 'prop-types';
// import './<%= fileName %>.css';
// export const <%= fileName %> = ({ primary, backgroundColor, size, label, ...props }) => {
//   const mode = primary ? 'storybook-button--primary' : 'storybook-button--secondary';
//   return (
//     <button
//       type="button"
//       className={['storybook-button', `storybook-button--${size}`, mode].join(' ')}
//       style={backgroundColor && { backgroundColor }}
//       {...props}
//     >
//       {label}
//     </button>
//   );
// };
// <%= fileName %>.propTypes = {
//   primary: PropTypes.bool,
//   backgroundColor: PropTypes.string,
//   size: PropTypes.oneOf(['small', 'medium', 'large']),
//   label: PropTypes.string.isRequired,
//   onClick: PropTypes.func,
// };
// <%= fileName %>.defaultProps = {
//   backgroundColor: null,
//   primary: false,
//   size: 'medium',
//   onClick: undefined,
// };
