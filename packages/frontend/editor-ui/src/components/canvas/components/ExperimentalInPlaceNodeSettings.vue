<script setup lang="ts">
import ExperimentalCanvasNodeSettings from './ExperimentalCanvasNodeSettings.vue';
import { useNodeSettingsInCanvas } from '../composables/useNodeSettingsInCanvas';
import { useCanvasStore } from '@/stores/canvas.store';
import { computed } from 'vue';

const { nodeId } = defineProps<{ nodeId: string }>();

const { maxCanvasZoom = 4 } = useNodeSettingsInCanvas();
const canvasStore = useCanvasStore();
const isExpanded = computed(() => !canvasStore.collapsedNodes[nodeId]);

function handleToggleExpand() {
	canvasStore.setNodeExpanded(nodeId);
}
</script>

<template>
	<div :class="$style.component">
		<ExperimentalCanvasNodeSettings
			v-if="isExpanded"
			:node-id="nodeId"
			:style="{ zoom: `${1 / maxCanvasZoom}` }"
		>
			<template #actions>
				<N8nIconButton
					:icon="isExpanded ? 'compress' : 'expand'"
					type="secondary"
					text
					size="mini"
					icon-size="large"
					aria-label="Toggle expand"
					@click="handleToggleExpand"
				/>
			</template>
		</ExperimentalCanvasNodeSettings>
		<div v-else :class="$style.collapsed">
			Collapsed<N8nIconButton
				:icon="isExpanded ? 'compress' : 'expand'"
				type="secondary"
				text
				size="mini"
				icon-size="large"
				aria-label="Toggle expand"
				@click="handleToggleExpand"
			/>
		</div>
	</div>
</template>

<style lang="scss" module>
.component {
	width: calc(var(--canvas-node--width) * 1.6) !important;
	max-height: min(360px, calc(var(--canvas-node--width) * 2.4)) !important;
	min-height: calc(var(--canvas-node--width) * 0.5) !important;
	height: auto !important;
	align-items: flex-start;
	justify-content: stretch;
	overflow: auto;
	border-radius: var(--border-radius-large) !important;
	border: var(--canvas-node-border-width) solid
		var(--canvas-node--border-color, var(--color-foreground-xdark));
	cursor: default !important;
	overflow: hidden;

	&.collapsed {
	}
}
</style>
