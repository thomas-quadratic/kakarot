import pytest
import pytest_asyncio
from starkware.starknet.testing.starknet import Starknet


@pytest_asyncio.fixture(scope="module")
async def system_operations(starknet: Starknet):
    return await starknet.deploy(
        source="./tests/cairo_files/instructions/test_system_operations.cairo",
        cairo_path=["src"],
        disable_hint_validation=True,
    )


@pytest.mark.asyncio
class TestSystemOperations:
    @pytest.mark.xfail(strict=True)
    async def test_revert(self, system_operations):
        await system_operations.test_exec_revert(reason=1000).call()

    async def test_call(
        self, system_operations, contract_account_class, account_registry, kakarot
    ):
        await system_operations.test__exec_call__should_return_a_new_context_based_on_calling_ctx_stack(
            contract_account_class.class_hash,
            account_registry.contract_address,
            kakarot.contract_address,
        ).call()
