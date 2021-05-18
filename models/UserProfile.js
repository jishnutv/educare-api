const DataTypes = require('sequelize');
const db = require('../config/db')
const Teams = require('../models/Teams');
const Services = require('../models/Services');

const UserProfile = db.define('centreprofiles', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    centre_name: {
      type: DataTypes.STRING
    },
    caption: {
      type: DataTypes.STRING
    },
    addressline1: {
      type: DataTypes.STRING
    },
    addressline2: {
      type: DataTypes.STRING
    },
    district: {
      type: DataTypes.STRING
    },
    state: {
      type: DataTypes.STRING
    },
    country: {
      type: DataTypes.STRING
    },
    pincode: {
      type: DataTypes.STRING
    },
    website: {
      type: DataTypes.STRING
    },
    phone1: {
      type: DataTypes.STRING
    },
    phone2: {
      type: DataTypes.STRING
    },
    logo: {
      type: DataTypes.STRING
    },
    office: {
      type: DataTypes.STRING
    },
    latitude: {
      type: DataTypes.STRING
    },
    longitude: {
      type: DataTypes.STRING
    },
    services: {
      type: DataTypes.STRING
    },
    reg_no_prefix: {
      type: DataTypes.STRING
    },
    addmission_fee: {
      type: DataTypes.STRING
    },
    about: {
      type: DataTypes.STRING
    },
    status: {
      type: DataTypes.STRING
    },
    whatsapp: {
      type: DataTypes.STRING
    },
    facebook: {
      type: DataTypes.STRING
    },
    insta: {
      type: DataTypes.STRING
    },
    linkedin: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

UserProfile.hasMany(Teams, {foreignKey: "user_id", as: "centerTeams"});
Teams.belongsTo(UserProfile, {foreignKey: "user_id", as: "centerProfile"});

UserProfile.hasMany(Services, {foreignKey: "user_id", as: "centerServices"});
Services.belongsTo(UserProfile, {foreignKey: "user_id", as: "centerProfile"});

module.exports = UserProfile;