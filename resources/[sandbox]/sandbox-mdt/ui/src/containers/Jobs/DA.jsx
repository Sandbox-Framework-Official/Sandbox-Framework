import React from 'react';
import { useSelector } from 'react-redux';
import { makeStyles } from '@mui/styles';
import { Route, Routes } from 'react-router';

import links from './links';
import { Navbar, AdminRoute, ErrorBoundary } from '../../components';
import { Landing } from '../../pages/Public';
import Titlebar from '../../components/Titlebar';

import Error from '../../pages/Error';
import Reports from '../../pages/Reports';
import Roster from '../../pages/Roster';
import People from '../../pages/People';
import PenalCode from '../../pages/PenalCode';
import Vehicles from '../../pages/Vehicles';
import Properties from '../../pages/Properties';
import PermissionManager from '../../pages/PermissionManager';
import Firearms from '../../pages/Firearms';
import Warrants from '../../pages/Warrants';
import Library from '../../pages/Library';
import { AdminCharges, AdminNotice } from '../../pages/Admin';

const useStyles = makeStyles((theme) => ({
	container: {
		height: '100%',
	},
	wrapper: {
		maxHeight: 'calc(100% - 193px)',
		flexGrow: 1,
	},
	content: {
		height: '100%',
		overflowY: 'auto',
		overflowX: 'hidden',
	},
	maxHeight: {
		height: '100%',
	},
	mdt: {
		display: 'flex',
		flexDirection: 'column',
		height: '100%',
	}
}));

export default () => {
	const classes = useStyles();
	const job = useSelector((state) => state.app.govJob);

	return (
		<div className={classes.container}>
			<div className={classes.mdt}>
				<div>
					<Titlebar>
						<Navbar links={links(job?.Id, job?.Workplace?.Id)} />
					</Titlebar>
				</div>
				<div className={classes.wrapper}>
					<ErrorBoundary>
						<div className={classes.content}>
							<Routes>
								<Route exact path="/reports" element={<Reports />} />
								<Route exact path="/people" element={<People />} />
								<Route exact path="/vehicles" element={<Vehicles />} />
								<Route exact path="/properties" element={<Properties />} />
								<Route exact path="/firearms" element={<Firearms />} />
								<Route exact path="/warrants" element={<Warrants />} />
								<Route exact path="/roster" element={<Roster />} />
								<Route exact path="/penal-code" element={<PenalCode />} />
								<Route exact path="/library" element={<Library />} />

								<Route exact path="create/notice" element={<AdminNotice />} />
								<Route exact path="/" element={<Landing />} />
								<Route element={<Error />} />
								<Route path="/system" element={<AdminRoute permission={true} />}>
									<Route exact path="charges" element={<AdminCharges />} />
									<Route exact path="gov-roster" element={<Roster systemAdminMode />} />
									<Route
										exact
										path="gov-permissions"
										element={<PermissionManager job="system" />}
									/>
								</Route>
							</Routes>
						</div>
					</ErrorBoundary>
				</div>
			</div>
		</div>
	);
};
