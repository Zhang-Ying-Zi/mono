import { Story, Meta } from '@storybook/web-components';
import { Page, PageProps } from './LoginPage';
import * as HeaderStories from '../../components/Header/Header.stories';

export default {
  title: 'PAGES/LoginPage',
  argTypes: {
    onLogin: { action: 'onLogin' },
    onLogout: { action: 'onLogout' },
    onCreateAccount: { action: 'onCreateAccount' },
  }
} as Meta;

const Template: Story<PageProps> = (args) => Page(args);

export const LoggedIn = Template.bind({});
LoggedIn.args = {
  // More on composing args: https://storybook.js.org/docs/web-components/writing-stories/args#args-composition
  ...HeaderStories.LoggedIn.args,
};

export const LoggedOut = Template.bind({});
LoggedOut.args = {
  ...HeaderStories.LoggedOut.args,
};
