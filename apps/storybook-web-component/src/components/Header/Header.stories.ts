import { Story, Meta } from '@storybook/web-components';
import { Header, HeaderProps } from './Header';

export default {
  title: 'COMPONENTS/Header',
  argTypes: {
    onLogin: { action: 'onLogin' },
    onLogout: { action: 'onLogout' },
    onCreateAccount: { action: 'onCreateAccount' },
  }
} as Meta;

const Template: Story<HeaderProps> = (args) => Header(args);

export const LoggedIn = Template.bind({});
LoggedIn.args = {
  user: {},
};

export const LoggedOut = Template.bind({});
LoggedOut.args = {};
