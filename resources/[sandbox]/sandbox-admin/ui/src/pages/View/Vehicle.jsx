import React, { useEffect, useState } from 'react';
import {
	List,
	ListItem,
	ListItemText,
	Grid,
	Alert,
	Button,
	Avatar,
	TextField,
	InputAdornment,
	IconButton,
	ButtonGroup,
	FormGroup,
	FormControlLabel,
	Switch,
	Chip,
	MenuItem,
	ListItemButton,
} from '@material-ui/core';
import { makeStyles } from '@material-ui/styles';
import { toast } from 'react-toastify';
import moment from 'moment';
import Moment from 'react-moment';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { Link, useHistory } from 'react-router-dom';

import { Loader, Modal } from '../../components';
import Nui from '../../util/Nui';
import { useSelector } from 'react-redux';
import { round } from 'lodash';

import { CurrencyFormat } from '../../util/Parser';

const useStyles = makeStyles((theme) => ({
	wrapper: {
		padding: '20px 10px 20px 20px',
		height: '100%',
	},
	link: {
		color: theme.palette.text.alt,
		transition: 'color ease-in 0.15s',
		'&:hover': {
			color: theme.palette.primary.main,
		},
		'&:not(:last-of-type)::after': {
			color: theme.palette.text.main,
			content: '", "',
		},
	},
	item: {
		margin: 4,
		transition: 'background ease-in 0.15s',
		border: `1px solid ${theme.palette.border.divider}`,
		margin: 7.5,
		transition: 'filter ease-in 0.15s',
		'&:hover': {
			filter: 'brightness(0.8)',
			cursor: 'pointer',
		},
	},
	editorField: {
		marginBottom: 10,
	},
	listItemWrapper: {
		padding: '20px 10px 20px 20px',
		borderBottom: `1px solid ${theme.palette.border.divider}`,
		'&:first-of-type': {
			borderTop: `1px solid ${theme.palette.border.divider}`,
		},
	},
}));

export default ({ match }) => {
	const classes = useStyles();
	const history = useHistory();
	const user = useSelector(state => state.app.user);
	const permission = useSelector(state => state.app.permission);
	const permissionLevel = useSelector(state => state.app.permissionLevel);

	const [err, setErr] = useState(false);
	const [loading, setLoading] = useState(false);

	const [vehicle, setVehicle] = useState(null);

	const fetch = async (forced) => {
		if (!vehicle || forced) {
			setLoading(true);
			try {
				let res = await (await Nui.send('GetVehicle', parseInt(match.params.id))).json();


				if (res) {
					setVehicle(res);
				} else toast.error('Unable to Load');
			} catch (err) {
				console.log(err);
				toast.error('Unable to Load');
				setErr(true);

				// setVehicle({
				// 	Make: "Ford",
				// 	Model: "Focus",
				// 	VIN: "RRRRRRRRRRRRRRRRRRRRRRRR",
				// 	Owned: true,
				// 	Owner: {
				// 		Id: 1,
				// 		Type: 1,
				// 	},
				// 	Plate: "TWAT",
				// 	Value: 1000,
				// 	EntityModel: 111111,
				// 	Coords: {
				// 		x: 1,
				// 		y: 1,
				// 		z: 1,
				// 	},
				// 	Heading: 200,
				// 	Damage: 1000,
				// 	DamagedParts: 1000,
				// });
			}
			setLoading(false);
		}
	};

	useEffect(() => {
		fetch();
	}, [match]);

	const onRefresh = () => {
		fetch(true);
	};

	const onAction = async (action) => {
		try {
			let res = await (await Nui.send('ActionVehicle', {
				model: vehicle?.EntityModel,
				target: vehicle?.Entity,
				action: action,
			})).json();

			if (res && res.success) {
				toast.success(res.message);
			} else {
				if (res && res.message) {
					toast.error(res.message);
				} else {
					toast.error('Error');
				}
			}
		} catch (err) {
			toast.error('Error');
		}
	}

	return (
		<div>
			{loading || (!vehicle && !err) ? (
				<div
					className={classes.wrapper}
					style={{ position: 'relative' }}
				>
					<Loader static text="Loading" />
				</div>
			) : err ? (
				<Grid className={classes.wrapper} container>
					<Grid item xs={12}>
						<Alert variant="outlined" severity="error">
							Invalid Vehicle
						</Alert>
					</Grid>
				</Grid>
			) : (
				<>
					<Grid className={classes.wrapper} container spacing={2}>
						<Grid item xs={12}>
							<ButtonGroup fullWidth variant="contained">
								<Button onClick={() => onAction('repair')}>
									Quick Repair
								</Button>
								{permissionLevel >= 90 && <Button onClick={() => onAction('repair_full')}>
									Full Repair
								</Button>}
								{permissionLevel >= 90 && <Button onClick={() => onAction('repair_engine')}>
									Engine Repair
								</Button>}
								{permissionLevel >= 90 && <Button onClick={() => onAction('fuel')}>
									Fuel
								</Button>}
								{permissionLevel >= 75 && <Button onClick={() => onAction('sitinside')}>
									Sit Inside
								</Button>}
								{permissionLevel >= 90 && <Button onClick={() => onAction('locks')}>
									Toggle Locks
								</Button>}
								<Button onClick={onRefresh}>
									Refresh
								</Button>
							</ButtonGroup>
						</Grid>
						<Grid item xs={6}>
							<List>
								<ListItem>
									<ListItemText
										primary="Owned"
										secondary={`${vehicle.Owned ? `Yes - ${vehicle.Owner?.Id}` : 'No'}`}
									/>
								</ListItem>
								<ListItem>
									<ListItemText
										primary="Vehicle Name"
										secondary={`${vehicle.Make ?? 'Unknown'} ${vehicle.Model ?? 'Unknown'}`}
									/>
								</ListItem>
								<ListItem>
									<ListItemText
										primary="Vehicle VIN"
										secondary={vehicle.VIN}
									/>
								</ListItem>
								<ListItem>
									<ListItemText
										primary="Vehicle Plate"
										secondary={vehicle.Plate}
									/>
								</ListItem>
								<ListItem>
									<ListItemText
										primary="Estimated Value"
										secondary={`$${vehicle.Value ?? 0}`}
									/>
								</ListItem>
								<ListItem onClick={() => copyInfo(vehicle.EntityModel)}>
									<ListItemText
										primary="Vehicle Entity Model"
										secondary={`${vehicle.EntityModel}`}
									/>
								</ListItem>
								<ListItem onClick={() => copyInfo(`vector3(${round(vehicle.Coords?.x, 2)}, ${round(vehicle.Coords?.y, 2)}, ${round(vehicle.Coords?.z, 2)})`)}>
									<ListItemText
										primary="Coordinates"
										secondary={`vector3(${round(vehicle.Coords?.x, 2)}, ${round(vehicle.Coords?.y, 2)}, ${round(vehicle.Coords?.z, 2)})`}
									/>
								</ListItem>
								<ListItem onClick={() => copyInfo(`${round(vehicle.Heading, 2)}`)}>
									<ListItemText
										primary="Heading"
										secondary={`${round(vehicle.Heading, 2)}`}
									/>
								</ListItem>
							</List>
						</Grid>
						<Grid item xs={6}>
							<List>
								<ListItem>
									<ListItemText
										primary="Fuel"
										secondary={round(vehicle.Fuel, 0)}
									/>
								</ListItem>
								<ListItem>
									<ListItemText
										primary="Engine Damage"
										secondary={round(vehicle.Damage?.Engine ?? 1000, 0)}
									/>
								</ListItem>
								<ListItem>
									<ListItemText
										primary="Body Damage"
										secondary={round(vehicle.Damage?.Body ?? 1000, 0)}
									/>
								</ListItem>
								{vehicle.DamagedParts && (
									<>
										<ListItem>
											<ListItemText
												primary="Axle"
												secondary={round(vehicle.DamagedParts?.Axle, 2)}
											/>
										</ListItem>
										<ListItem>
											<ListItemText
												primary="Radiator"
												secondary={round(vehicle.DamagedParts?.Radiator, 2)}
											/>
										</ListItem>
										<ListItem>
											<ListItemText
												primary="Transmission"
												secondary={round(vehicle.DamagedParts?.Transmission, 2)}
											/>
										</ListItem>
										<ListItem>
											<ListItemText
												primary="Fuel Injectors"
												secondary={round(vehicle.DamagedParts?.FuelInjectors, 2)}
											/>
										</ListItem>
										<ListItem>
											<ListItemText
												primary="Brakes"
												secondary={round(vehicle.DamagedParts?.Brakes, 2)}
											/>
										</ListItem>
										<ListItem>
											<ListItemText
												primary="Clutch"
												secondary={round(vehicle.DamagedParts?.Clutch, 2)}
											/>
										</ListItem>
										<ListItem>
											<ListItemText
												primary="Electronics"
												secondary={round(vehicle.DamagedParts?.Electronics, 2)}
											/>
										</ListItem>
									</>
								)}
							</List>
						</Grid>
						<Grid item xs={12}>
							<ButtonGroup fullWidth variant="contained">
								{permissionLevel >= 90 && <Button onClick={() => onAction('stall')}>
									Stall
								</Button>}
								{permissionLevel >= 90 && <Button onClick={() => onAction('explode')}>
									Explode
								</Button>}
								{permissionLevel >= 75 && <Button onClick={() => onAction('delete')}>
									Delete
								</Button>}
							</ButtonGroup>
						</Grid>
					</Grid>
				</>
			)}
		</div>
	);
};
