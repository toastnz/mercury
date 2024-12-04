<section class="text-element [ element {$Width} ][ js-userform-{$ID} ]">
	<div class="text-element__wrap">

		<% if $IsFinished %>
			<div class="message success">
				$FormSuccessMessage
			</div>
		<% else %>
			$Form
		<% end_if %>
		
	</div>

	<script>
	/*------------------------------------------------------------------
    Galleries
    ------------------------------------------------------------------*/

    let userDefinedForm = document.querySelector('.js-userform-{$ID} form');

    if (userDefinedForm) {
        userDefinedForm.addEventListener('submit', function (event) {
            event.preventDefault();

            userDefinedForm.classList.add('busy');

            fetch(userDefinedForm.getAttribute('action'), {
                method: 'POST',
                body: new FormData(userDefinedForm),
            })
                .then((response) => response.json())
                .then((data) => {

                    if (data.code === 200) {

                        userDefinedForm.reset();

                        userDefinedForm.insertAdjacentHTML('beforeend', `<p class="colour--white" style="display: inline-block;font-size: 1.4rem;width: 100%;margin-top:0;"><b>${data.message}</b></p>`);
                    }

                    userDefinedForm.classList.remove('busy');

                })
                .catch((data) => {
                    userDefinedForm.classList.remove('busy');
                });
        });
    }

	</script>

</section>
