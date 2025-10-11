class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :scripts, dependent: :destroy
  has_many :checklists, dependent: :destroy
  has_many :participants, dependent: :destroy

  has_many :script_comments, dependent: :destroy
  has_many :script_items, dependent: :destroy
  has_many :script_spents, dependent: :destroy
  has_many :checklist_items, dependent: :destroy

  has_many :participated_scripts, through: :participants, source: :script

end
