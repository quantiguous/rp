require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

module Rp
  RSpec.describe ReportsController, type: :controller do

    # This should return the minimal set of attributes required to create a valid
    # Report. As you add validations to Report, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      skip("Add a hash of attributes valid for your model")
    }

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # ReportsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
      it "assigns all reports as @reports" do
        report = FactoryGirl.create(:rp_report)
        get :index
        expect(assigns(:available_reports)).to eq([report])
      end
    end

    # describe "GET #show" do
    #   it "assigns the requested report as @report" do
    #     report = Report.create! valid_attributes
    #     get :show, params: {id: report.to_param}, session: valid_session
    #     expect(assigns(:report)).to eq(report)
    #   end
    # end
    #
    # describe "GET #new" do
    #   it "assigns a new report as @report" do
    #     get :new, params: {}, session: valid_session
    #     expect(assigns(:report)).to be_a_new(Report)
    #   end
    # end
    #
    # describe "GET #edit" do
    #   it "assigns the requested report as @report" do
    #     report = Report.create! valid_attributes
    #     get :edit, params: {id: report.to_param}, session: valid_session
    #     expect(assigns(:report)).to eq(report)
    #   end
    # end
    #
    # describe "POST #create" do
    #   context "with valid params" do
    #     it "creates a new Report" do
    #       expect {
    #         post :create, params: {report: valid_attributes}, session: valid_session
    #       }.to change(Report, :count).by(1)
    #     end
    #
    #     it "assigns a newly created report as @report" do
    #       post :create, params: {report: valid_attributes}, session: valid_session
    #       expect(assigns(:report)).to be_a(Report)
    #       expect(assigns(:report)).to be_persisted
    #     end
    #
    #     it "redirects to the created report" do
    #       post :create, params: {report: valid_attributes}, session: valid_session
    #       expect(response).to redirect_to(Report.last)
    #     end
    #   end
    #
    #   context "with invalid params" do
    #     it "assigns a newly created but unsaved report as @report" do
    #       post :create, params: {report: invalid_attributes}, session: valid_session
    #       expect(assigns(:report)).to be_a_new(Report)
    #     end
    #
    #     it "re-renders the 'new' template" do
    #       post :create, params: {report: invalid_attributes}, session: valid_session
    #       expect(response).to render_template("new")
    #     end
    #   end
    # end
    #
    # describe "PUT #update" do
    #   context "with valid params" do
    #     let(:new_attributes) {
    #       skip("Add a hash of attributes valid for your model")
    #     }
    #
    #     it "updates the requested report" do
    #       report = Report.create! valid_attributes
    #       put :update, params: {id: report.to_param, report: new_attributes}, session: valid_session
    #       report.reload
    #       skip("Add assertions for updated state")
    #     end
    #
    #     it "assigns the requested report as @report" do
    #       report = Report.create! valid_attributes
    #       put :update, params: {id: report.to_param, report: valid_attributes}, session: valid_session
    #       expect(assigns(:report)).to eq(report)
    #     end
    #
    #     it "redirects to the report" do
    #       report = Report.create! valid_attributes
    #       put :update, params: {id: report.to_param, report: valid_attributes}, session: valid_session
    #       expect(response).to redirect_to(report)
    #     end
    #   end
    #
    #   context "with invalid params" do
    #     it "assigns the report as @report" do
    #       report = Report.create! valid_attributes
    #       put :update, params: {id: report.to_param, report: invalid_attributes}, session: valid_session
    #       expect(assigns(:report)).to eq(report)
    #     end
    #
    #     it "re-renders the 'edit' template" do
    #       report = Report.create! valid_attributes
    #       put :update, params: {id: report.to_param, report: invalid_attributes}, session: valid_session
    #       expect(response).to render_template("edit")
    #     end
    #   end
    # end
    #
    # describe "DELETE #destroy" do
    #   it "destroys the requested report" do
    #     report = Report.create! valid_attributes
    #     expect {
    #       delete :destroy, params: {id: report.to_param}, session: valid_session
    #     }.to change(Report, :count).by(-1)
    #   end
    #
    #   it "redirects to the reports list" do
    #     report = Report.create! valid_attributes
    #     delete :destroy, params: {id: report.to_param}, session: valid_session
    #     expect(response).to redirect_to(reports_url)
    #   end
    # end

  end
end
